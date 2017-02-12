"use strict";
var Compiler = require("./compiler");
var Configuration = require("./configuration");
// tslint:disable-next-line:no-var-requires
var Bundler = require("../lib/bundler");
// tslint:disable-next-line:no-var-requires
var Coverage = require("../lib/coverage");
// tslint:disable-next-line:no-var-requires
var Framework = require("../lib/framework");
// tslint:disable-next-line:no-var-requires
var Preprocessor = require("../lib/preprocessor");
// tslint:disable-next-line:no-var-requires
var Reporter = require("../lib/reporter");
var sharedProcessedFiles = {};
var configuration = new Configuration();
var coverage = new Coverage(configuration);
var bundler = new Bundler(configuration, coverage);
var compiler = new Compiler(configuration);
var framework = new Framework(bundler, compiler, configuration, coverage);
var preprocessor = new Preprocessor(bundler, compiler, configuration, coverage, sharedProcessedFiles);
var reporter = new Reporter(configuration, sharedProcessedFiles);
module.exports = {
    "framework:karma-typescript": ["factory", framework.create],
    "preprocessor:karma-typescript": ["factory", preprocessor.create],
    "reporter:karma-typescript": ["type", reporter.create]
};
