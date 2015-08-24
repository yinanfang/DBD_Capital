'use strict';

module.exports = {
  // Debug vs Production
  isProduction: true,

  JWTSecret: '',

  Production: {
    DB: {
      Type: 'mysql',
      Host: 'web404.webfaction.com',
      Name: 'dbdcapital',
      User: '',
      Password: '',
      Charset: 'utf8'
    }
  },
  Debug: {
    DB: {
      Type: 'mysql',
      Host: 'web404.webfaction.com',
      Name: 'dbdcapital_dev',
      User: '',
      Password: '',
      Charset: 'utf8'
    }
  },



  app: {
    name: 'MEAN - A Modern Stack - Production'
  },
  emailFrom: 'yinanfang@gmail.com',
  mailer: {
    service: 'SERVICE_PROVIDER',
    auth: {
      user: 'EMAIL_ID',
      pass: 'PASSWORD'
    }
  },
  secret: 'SOME_TOKEN_SECRET',
  logging: {
    format: 'combined'
  },
  strategies: {
      local: {
        enabled: true
      },
      facebook: {
        clientID: 'APP_ID',
        clientSecret: 'APP_SECRET',
        callbackURL: 'http://localhost:3000/api/auth/facebook/callback',
        enabled: false
      },
      twitter: {
        clientID: 'CONSUMER_KEY',
        clientSecret: 'CONSUMER_SECRET',
        callbackURL: 'http://localhost:3000/api/auth/twitter/callback',
        enabled: false
      },
      github: {
        clientID: 'APP_ID',
        clientSecret: 'APP_SECRET',
        callbackURL: 'http://localhost:3000/api/auth/github/callback',
        enabled: false
      },
      google: {
        clientID: 'APP_ID',
        clientSecret: 'APP_SECRET',
        callbackURL: 'http://localhost:3000/api/auth/google/callback',
        enabled: false
      },
      linkedin: {
        clientID: 'API_KEY',
        clientSecret: 'SECRET_KEY',
        callbackURL: 'http://localhost:3000/api/auth/linkedin/callback',
        enabled: false
      }
  },
};
