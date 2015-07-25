var svg2png = require('svg2png');

var jdenticon = require("jdenticon"),
    SvgContext = require("./SvgContext.js"),
    fs = require("fs"),
    size = 1000,
    hash = "cd53f27dd778822b3c9f1074de0dd731", // md5 hash
    ctx = new SvgContext(size, size);

jdenticon.drawIcon(ctx, hash, size);
fs.writeFileSync(__dirname + "/testicon.svg", ctx.toSvg());

svg2png(__dirname + "/testicon.svg", __dirname + "/dest.png", function (err) {
  console.log(err);
});
