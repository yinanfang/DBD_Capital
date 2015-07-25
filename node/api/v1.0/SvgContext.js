
/**
 * A CanvasRenderingContext2D implementation containing the subset required by Jdenticon
 * for generating svg files.
 * @license zlib (http://opensource.org/licenses/Zlib)
 * @copyright Daniel Mester Pirttijärvi 2015
 * @constructor
 */
function SvgContext(width, height) {
    this._svg = '<svg width="' + width + '" height="' + height +
        '" version="1.1" xmlns="http://www.w3.org/2000/svg">';
    this._savedTranslations = [];
    this._translation = { x: 0, y: 0 };
}
SvgContext.prototype = {
    moveTo: function (x, y) {
        this._path += "M " +
            (x + this._translation.x) + " " + (y + this._translation.y) + " ";
    },
    lineTo: function (x, y) {
        this._path += "L " +
            (x + this._translation.x) + " " + (y + this._translation.y) + " ";
    },
    bezierCurveTo: function (cp1x, cp1y, cp2x, cp2y, x, y) {
        var translation = this._translation;
        this._path +=
            "C " + (cp1x + translation.x) + " " + (cp1y + translation.y) +
            ", " + (cp2x + translation.x) + " " + (cp2y + translation.y) +
            ", " + (x + translation.x) + " " + (y + translation.y) + " ";
    },
    beginPath: function () {
        this._path = "";
    },
    closePath: function () {
        this._path += " z";
    },
    fill: function () {
        var fillStyle = colorToHexRgb(this.fillStyle);
        if (fillStyle) {
            this._svg += '<path fill="' + fillStyle + '" d="' + this._path + '"/>';
        }
    },
    save: function () {
        this._savedTranslations.push(this._translation);
        this._translation = { x: this._translation.x, y: this._translation.y };
    },
    restore: function () {
        if (this._savedTranslations.length) {
            this._translation = this._savedTranslations.pop();
        }
    },
    clearRect: function () {
    },
    translate: function (dx, dy) {
        this._translation.x += dx;
        this._translation.y += dy;
    },
    toSvg: function () {
        return this._svg + '</svg>';
    }
};

function colorToHexRgb(color) {
    function decToHex(v) {
        v |= 0; // Ensure integer value
        return v < 0 ? "" :
            v < 16 ? "0" + v.toString(16) :
            v < 256 ? v.toString(16) :
            "ff";
    }
    function hueToRgb(m1, m2, h) {
        h = h < 0 ? h + 360 : h > 360 ? h - 360 : h;
        return decToHex(
            h < 60 ? m1 * 255 + (m2 - m1) * h * 4.25 :
            h < 180 ? m2 * 255 :
            h < 240 ? m1 * 255 + (m2 - m1) * (240 - h) * 4.25 :
            m1 * 255);
    }

    // SVG only supports CSS2 colors, rgba and hsla is defined in CSS3
    if (color) {
        var rgba = color.match(/rgba\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,[^),]+\)/);
        if (rgba) {
            var r = Number(rgba[1]),
                g = Number(rgba[2]),
                b = Number(rgba[3]);

            return "#" + decToHex(r) + decToHex(g) + decToHex(b);
        }

        var hsla = color.match(/hsla\(\s*(\d+)\s*,\s*(\d+)%\s*,\s*(\d+)%\s*,[^),]+\)/);
        if (hsla) {
            var h = Number(hsla[1]),
                s = Number(hsla[2]),
                l = Number(hsla[3]);

            h = h < 0 ? 0 : h > 360 ? 360 : h;
            s = s < 0 ? 0 : s > 100 ? 100 : s;
            l = l < 0 ? 0 : l > 100 ? 100 : l;

            if (s == 0) {
                var partialHex = (0 | (l * 2.55)).toString(16);
                if (partialHex.length < 2) partialHex = "0" + partialHex;
                return "#" + partialHex + partialHex + partialHex;
            }
            else {
                var m2 = l < 50 ? l * 0.01 * (1 + s * 0.01) : (l + s - l * s * 0.01) * 0.01;
                var m1 = 0.02 * l - m2;

                return "#" +
                    hueToRgb(m1, m2, h + 120) +
                    hueToRgb(m1, m2, h) +
                    hueToRgb(m1, m2, h - 120);
            }
        }
    }
    return color;
}

module.exports = SvgContext;
