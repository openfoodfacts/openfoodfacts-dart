# Changelog

## [1.28.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.27.1...v1.28.0) (2022-11-22)


### Features

* [#596](https://github.com/openfoodfacts/openfoodfacts-dart/issues/596) - added Origin Taxonomy ([#608](https://github.com/openfoodfacts/openfoodfacts-dart/issues/608)) ([bfe0f11](https://github.com/openfoodfacts/openfoodfacts-dart/commit/bfe0f1171b6f3a2b12d6d93a6613ced1ed2543d5))
* [#605](https://github.com/openfoodfacts/openfoodfacts-dart/issues/605) - taxonomy - support of packaging materials and shapes ([#610](https://github.com/openfoodfacts/openfoodfacts-dart/issues/610)) ([43f83a9](https://github.com/openfoodfacts/openfoodfacts-dart/commit/43f83a97749442548cf68f5b1e0791483367431f))
* [#614](https://github.com/openfoodfacts/openfoodfacts-dart/issues/614) - taxonomy - support of packaging recycling ([#615](https://github.com/openfoodfacts/openfoodfacts-dart/issues/615)) ([716db4d](https://github.com/openfoodfacts/openfoodfacts-dart/commit/716db4d0cec3373de1250fe383c79b142f189b93))


### Bug Fixes

* [#223](https://github.com/openfoodfacts/openfoodfacts-dart/issues/223) - deprecated method getIngredientSpellingCorrection ([#627](https://github.com/openfoodfacts/openfoodfacts-dart/issues/627)) ([9da441f](https://github.com/openfoodfacts/openfoodfacts-dart/commit/9da441f4e930dd74ebff3547ed6ea1858403cf68))
* [#571](https://github.com/openfoodfacts/openfoodfacts-dart/issues/571) - last step of migration of enums to dart 2.17 ([#623](https://github.com/openfoodfacts/openfoodfacts-dart/issues/623)) ([cc1b388](https://github.com/openfoodfacts/openfoodfacts-dart/commit/cc1b388e726d8d2e3ea1883afdb5cdbadc7b66a8))
* [#571](https://github.com/openfoodfacts/openfoodfacts-dart/issues/571) - new enum upgrades to dart 2.17 ([#621](https://github.com/openfoodfacts/openfoodfacts-dart/issues/621)) ([dc2dfc3](https://github.com/openfoodfacts/openfoodfacts-dart/commit/dc2dfc3ebc72ff99529335926fab17fd49e9390e))
* [#609](https://github.com/openfoodfacts/openfoodfacts-dart/issues/609) - fix of failed getProduct integration test ([#616](https://github.com/openfoodfacts/openfoodfacts-dart/issues/616)) ([067752e](https://github.com/openfoodfacts/openfoodfacts-dart/commit/067752e5630413de25ad6b869205b58dcb1a8e1c))
* [#625](https://github.com/openfoodfacts/openfoodfacts-dart/issues/625) - no user credentials in header if null ([#626](https://github.com/openfoodfacts/openfoodfacts-dart/issues/626)) ([8566fcf](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8566fcfcdd2c67f0ee6914048dbf84f8ce50d67e))
* integrationTest with packaging recycling ([#622](https://github.com/openfoodfacts/openfoodfacts-dart/issues/622)) ([98a3deb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/98a3debca5a05bbcda05d492753336f85c403930))

## [1.27.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.27.0...v1.27.1) (2022-11-06)


### Bug Fixes

* Added response for incorrect email ([#604](https://github.com/openfoodfacts/openfoodfacts-dart/issues/604)) ([663a461](https://github.com/openfoodfacts/openfoodfacts-dart/commit/663a461d03881abc021d5efa5578edfa8786c4b7))

## [1.27.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.26.2...v1.27.0) (2022-10-25)


### Features

* [#596](https://github.com/openfoodfacts/openfoodfacts-dart/issues/596) - implemented autocomplete for ORIGINS ([#597](https://github.com/openfoodfacts/openfoodfacts-dart/issues/597)) ([f39e398](https://github.com/openfoodfacts/openfoodfacts-dart/commit/f39e398a30e4f484230580fea053235957156e0d))
* [#602](https://github.com/openfoodfacts/openfoodfacts-dart/issues/602) - added the "website" product field ([#603](https://github.com/openfoodfacts/openfoodfacts-dart/issues/603)) ([e9fe00a](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e9fe00ab947b91fe690705959ad38f951e020eb3))


### Bug Fixes

* [#507](https://github.com/openfoodfacts/openfoodfacts-dart/issues/507) - no more parameters in product URI ([#601](https://github.com/openfoodfacts/openfoodfacts-dart/issues/601)) ([313fd28](https://github.com/openfoodfacts/openfoodfacts-dart/commit/313fd28e39fdaeab5ed8dbaaa8eb4d49ed3f2908))
* [#598](https://github.com/openfoodfacts/openfoodfacts-dart/issues/598) - deprecated 2 "environment" fields ([#600](https://github.com/openfoodfacts/openfoodfacts-dart/issues/600)) ([5cb3ea3](https://github.com/openfoodfacts/openfoodfacts-dart/commit/5cb3ea3eaec51db77f7ee8b1f7f1efc591baef7f))

## [1.26.2](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.26.1...v1.26.2) (2022-10-23)


### Bug Fixes

* [#565](https://github.com/openfoodfacts/openfoodfacts-dart/issues/565) - added product field "nutrition data", better null value management ([#595](https://github.com/openfoodfacts/openfoodfacts-dart/issues/595)) ([6e2df43](https://github.com/openfoodfacts/openfoodfacts-dart/commit/6e2df43ecd626ba2c8e9f3fadf1b9f637bf82b34))
* [#592](https://github.com/openfoodfacts/openfoodfacts-dart/issues/592) - KnowledgePanelTextElement - 'type' instead of 'text_type' ([#593](https://github.com/openfoodfacts/openfoodfacts-dart/issues/593)) ([10f51cc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/10f51cc835dbb0b1a200ed7851ef228c26a05d97))
* Sending credentials to robotff ([#590](https://github.com/openfoodfacts/openfoodfacts-dart/issues/590)) ([2b09926](https://github.com/openfoodfacts/openfoodfacts-dart/commit/2b099261197b7a0d0cf8e42ccea4d66fddf4a960))

## [1.26.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.26.0...v1.26.1) (2022-10-16)


### Bug Fixes

* Also return [LoginStatus] when not logged in ([#585](https://github.com/openfoodfacts/openfoodfacts-dart/issues/585)) ([e97f877](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e97f877ade72389e2d3f5b4d8053710d0a5ea236))

## [1.26.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.25.0...v1.26.0) (2022-10-13)


### Features

* [#566](https://github.com/openfoodfacts/openfoodfacts-dart/issues/566) - refactored Nutriments as Map with new Nutrient class ([#570](https://github.com/openfoodfacts/openfoodfacts-dart/issues/570)) ([d30108f](https://github.com/openfoodfacts/openfoodfacts-dart/commit/d30108f6c73402773868b80333635ca18bfca1df))
* [#573](https://github.com/openfoodfacts/openfoodfacts-dart/issues/573) - getRandomRobotoffQuestion with optional insight types ([#574](https://github.com/openfoodfacts/openfoodfacts-dart/issues/574)) ([c8692c1](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c8692c1a9cee9daf6de89b96b12c2d80161d3c2d))
* [#579](https://github.com/openfoodfacts/openfoodfacts-dart/issues/579) - new method to log in, that returns data about user ([#583](https://github.com/openfoodfacts/openfoodfacts-dart/issues/583)) ([7994f45](https://github.com/openfoodfacts/openfoodfacts-dart/commit/7994f45d8936a6833dfa733c255851b9518d3f65))


### Bug Fixes

* [#565](https://github.com/openfoodfacts/openfoodfacts-dart/issues/565) - added 'nutrition_data' flag and energy fields ([#568](https://github.com/openfoodfacts/openfoodfacts-dart/issues/568)) ([bbb149f](https://github.com/openfoodfacts/openfoodfacts-dart/commit/bbb149f26d16385e34e4e7dfee92c05947f9ca29))
* ImageHelper - new methods with ImageSize parameters + minor fix ([#572](https://github.com/openfoodfacts/openfoodfacts-dart/issues/572)) ([24ec991](https://github.com/openfoodfacts/openfoodfacts-dart/commit/24ec991f29962af05aa1fe4313cd6648da7d8d84))
* KP panel groups sometimes have null title ([#576](https://github.com/openfoodfacts/openfoodfacts-dart/issues/576)) ([bf66f28](https://github.com/openfoodfacts/openfoodfacts-dart/commit/bf66f285856546329353547422bd96aaa1ac163a))
* make GitHub Projects more resilient ([#558](https://github.com/openfoodfacts/openfoodfacts-dart/issues/558)) ([fe319e0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/fe319e09f1d5866685681d965b249d2a6d1ffc8d))

## [1.25.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.24.0...v1.25.0) (2022-09-23)


### Features

* [#560](https://github.com/openfoodfacts/openfoodfacts-dart/issues/560) - optionally adding user credentials for POST requests ([#561](https://github.com/openfoodfacts/openfoodfacts-dart/issues/561)) ([d5cd14c](https://github.com/openfoodfacts/openfoodfacts-dart/commit/d5cd14cf3ee710f9045110c34e1ce1180bdddb8e))
* add funding links ([#547](https://github.com/openfoodfacts/openfoodfacts-dart/issues/547)) ([e52018a](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e52018a39ef026fe62f76e44905693ada416addf))


### Bug Fixes

* imageHelper - minor fix about Windows; deprecated methods ([#545](https://github.com/openfoodfacts/openfoodfacts-dart/issues/545)) ([eb0ac81](https://github.com/openfoodfacts/openfoodfacts-dart/commit/eb0ac81e65b285f88854d44ee6eaa3f5367b0776))
* integration tests around "getTaxonomy" ([#563](https://github.com/openfoodfacts/openfoodfacts-dart/issues/563)) ([a826add](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a826add65c6b993f748b2874ef501a5efc900497))

## [1.24.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.23.0...v1.24.0) (2022-08-15)


### Features

* [#516](https://github.com/openfoodfacts/openfoodfacts-dart/issues/516) - API v2 for multi barcode search ([#533](https://github.com/openfoodfacts/openfoodfacts-dart/issues/533)) ([2961310](https://github.com/openfoodfacts/openfoodfacts-dart/commit/296131080fdf8ef2087463bc00ec86c1d27a60e3))
* [#517](https://github.com/openfoodfacts/openfoodfacts-dart/issues/517) - added ECOSCORE and NUTRISCORE sort-by options ([#522](https://github.com/openfoodfacts/openfoodfacts-dart/issues/522)) ([a39ba24](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a39ba24b6a9daac6e36669b559891a536fcd27bf))
* [#524](https://github.com/openfoodfacts/openfoodfacts-dart/issues/524) - added ingredients analysis tags (vegan, vegetarian, palm oil free) ([#525](https://github.com/openfoodfacts/openfoodfacts-dart/issues/525)) ([645d903](https://github.com/openfoodfacts/openfoodfacts-dart/commit/645d9036b8619dd3c4d0f3f95b315d6bc1bc886d))
* [#526](https://github.com/openfoodfacts/openfoodfacts-dart/issues/526) - new AllergensParameter search filter ([#527](https://github.com/openfoodfacts/openfoodfacts-dart/issues/527)) ([3872351](https://github.com/openfoodfacts/openfoodfacts-dart/commit/387235177fd4007b8d6bc7bb644060bbc9634032))
* [#531](https://github.com/openfoodfacts/openfoodfacts-dart/issues/531) - new StatesTagsParameter search filter ([#532](https://github.com/openfoodfacts/openfoodfacts-dart/issues/532)) ([0fcd95d](https://github.com/openfoodfacts/openfoodfacts-dart/commit/0fcd95d826251f4a8121d6ba0fb286770b8e2395))
* new "Barcodes" parameter; deprecated configurations ([#538](https://github.com/openfoodfacts/openfoodfacts-dart/issues/538)) ([582775b](https://github.com/openfoodfacts/openfoodfacts-dart/commit/582775b77cd3a11c80a663b54e7bf8032178bde8))
* new field Product.novaGroup ([#540](https://github.com/openfoodfacts/openfoodfacts-dart/issues/540)) ([325c1e5](https://github.com/openfoodfacts/openfoodfacts-dart/commit/325c1e5b17dcc4b8d704964f36f346857213fdaa))


### Bug Fixes

* login ([#544](https://github.com/openfoodfacts/openfoodfacts-dart/issues/544)) ([1cd6feb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/1cd6feb9fdd388f003215e5741690ccbc7afef7b))

## [1.23.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.22.0...v1.23.0) (2022-07-15)


### Features

* Improvements for Sign up errors ([#511](https://github.com/openfoodfacts/openfoodfacts-dart/issues/511)) ([ebc5ff5](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ebc5ff50ba13b5151adac1bf1be7148b641898e5))


### Bug Fixes

* Removed over a year old deprecated methods/parameters ([#512](https://github.com/openfoodfacts/openfoodfacts-dart/issues/512)) ([e6108dc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e6108dc145d92af5a4b3ac3a4085047335d8e425))

## [1.22.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.21.0...v1.22.0) (2022-07-10)


### Features

* added "origins" field to product ([#509](https://github.com/openfoodfacts/openfoodfacts-dart/issues/509)) ([4b62004](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4b62004068b56a2ed124b7763e0b205185af50c3))


### Bug Fixes

* toBeCompleted - additional tests regarding the retrieved state tags ([#508](https://github.com/openfoodfacts/openfoodfacts-dart/issues/508)) ([ae1b8bc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ae1b8bc359fbaf6cd3e7ff44796a95c79d5245ec))

## [1.21.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.20.0...v1.21.0) (2022-07-06)


### Features

* [#503](https://github.com/openfoodfacts/openfoodfacts-dart/issues/503) - added the "all to-be-completed products" configuration ([#504](https://github.com/openfoodfacts/openfoodfacts-dart/issues/504)) ([b7c16ed](https://github.com/openfoodfacts/openfoodfacts-dart/commit/b7c16ed6e7c8167552bc6753bdce3882c3e53507))


### Bug Fixes

* toBeCompleted - fixed uri and parameters for to be completed and user queries ([#506](https://github.com/openfoodfacts/openfoodfacts-dart/issues/506)) ([67e2137](https://github.com/openfoodfacts/openfoodfacts-dart/commit/67e2137a934f3cdf65046ebdaa6ae5ca98791827))

## [1.20.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.19.0...v1.20.0) (2022-06-29)


### Features

* [#465](https://github.com/openfoodfacts/openfoodfacts-dart/issues/465) - new "limit" parameter for autocomplete suggestions ([#498](https://github.com/openfoodfacts/openfoodfacts-dart/issues/498)) ([4fd1f75](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4fd1f75bb75114aea3e26d67fb41c8e4ad0575da))
* [#488](https://github.com/openfoodfacts/openfoodfacts-dart/issues/488) - new user-related queries ([#499](https://github.com/openfoodfacts/openfoodfacts-dart/issues/499)) ([1ee5184](https://github.com/openfoodfacts/openfoodfacts-dart/commit/1ee51841c9dc640809cb8be09c47ee0bd602276a))
* [#494](https://github.com/openfoodfacts/openfoodfacts-dart/issues/494) - added OCR for packaging ([#497](https://github.com/openfoodfacts/openfoodfacts-dart/issues/497)) ([4c14abb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4c14abbbb2453e057453dcd60a761728b7addb1a))
* [#495](https://github.com/openfoodfacts/openfoodfacts-dart/issues/495) - new "action" element for knowledge panels ([#496](https://github.com/openfoodfacts/openfoodfacts-dart/issues/496)) ([317bee4](https://github.com/openfoodfacts/openfoodfacts-dart/commit/317bee49cf2e5915f3347f942b8e5514cbd832ea))

## [1.19.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.18.2...v1.19.0) (2022-06-22)


### Features

* [#481](https://github.com/openfoodfacts/openfoodfacts-dart/issues/481) - added product fields embCodes and manufacturingPlaces ([#490](https://github.com/openfoodfacts/openfoodfacts-dart/issues/490)) ([a30e7a5](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a30e7a55074a26a1a28ecc07b59284c4138369fa))
* saveProduct with language and country ([#491](https://github.com/openfoodfacts/openfoodfacts-dart/issues/491)) ([6e7d60e](https://github.com/openfoodfacts/openfoodfacts-dart/commit/6e7d60eb5eee08937ebbe91d18702f3e2a90e984))

## [1.18.2](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.18.1...v1.18.2) (2022-06-17)


### Bug Fixes

* [#482](https://github.com/openfoodfacts/openfoodfacts-dart/issues/482) add user agent parameters ([#484](https://github.com/openfoodfacts/openfoodfacts-dart/issues/484)) ([61d3ef7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/61d3ef7f307c4ff7d2edb1e84926a9700274377a))

## [1.18.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.18.0...v1.18.1) (2022-06-07)


### Bug Fixes

* [#477](https://github.com/openfoodfacts/openfoodfacts-dart/issues/477) - title is now optional in knowledge panel element ([#479](https://github.com/openfoodfacts/openfoodfacts-dart/issues/479)) ([4e7ffb2](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4e7ffb2f4fca53b64c43f2c55f32895b6f068d30))

## [1.18.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.17.1...v1.18.0) (2022-06-03)


### Features

* new product field comparedToCategory ([#474](https://github.com/openfoodfacts/openfoodfacts-dart/issues/474)) ([1d59448](https://github.com/openfoodfacts/openfoodfacts-dart/commit/1d594488784692f8a330770e208b8dc75d08fab6))

### [1.17.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.17.0...v1.17.1) (2022-05-26)


### Bug Fixes

* fix: Server not recognizing user additions ([#472](https://github.com/openfoodfacts/openfoodfacts-dart/issues/472)) ([52473d7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/52473d7b673c5d5a7d1964fde0336ae270120c22))

## [1.17.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.16.0...v1.17.0) (2022-05-20)


### Features

* [#466](https://github.com/openfoodfacts/openfoodfacts-dart/issues/466) - matched product v2 ([#467](https://github.com/openfoodfacts/openfoodfacts-dart/issues/467)) ([4ec6ee4](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4ec6ee4dc0aeb1c2b96764fbbe518ddfb94cf491))

## [1.16.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.15.0...v1.16.0) (2022-04-23)


### Features

* Expose to Attribute related Knowledge-panel panelID ([#456](https://github.com/openfoodfacts/openfoodfacts-dart/issues/456)) ([f49a94c](https://github.com/openfoodfacts/openfoodfacts-dart/commit/f49a94c3c495c13c30f0eddce4260915bae1380c))

## [1.15.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.14.0...v1.15.0) (2022-04-19)


### Features

* Barcodes validation for EAN8 & EAN13 ([#444](https://github.com/openfoodfacts/openfoodfacts-dart/issues/444)) ([0d3ac02](https://github.com/openfoodfacts/openfoodfacts-dart/commit/0d3ac02a1c38a0f46f78ed4facd20a93ac70bf80))
* README.md with a list of known apps using the SDK ([#435](https://github.com/openfoodfacts/openfoodfacts-dart/issues/435)) ([c25dece](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c25dece238e2cfdb36cba54b998ac3da259297f3))
* Support for Product - No nutrition data field ([#423](https://github.com/openfoodfacts/openfoodfacts-dart/issues/423)) ([c6ace40](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c6ace40ebd216ce5029c41831ac8dde3dad38777))
* Username max length ([#442](https://github.com/openfoodfacts/openfoodfacts-dart/issues/442)) ([14eaec0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/14eaec0f5fa7799095cdb749a845f7f17b897e23))


### Bug Fixes

* [#241](https://github.com/openfoodfacts/openfoodfacts-dart/issues/241) Added "energy-kj" ([#418](https://github.com/openfoodfacts/openfoodfacts-dart/issues/418)) ([3f55bfa](https://github.com/openfoodfacts/openfoodfacts-dart/commit/3f55bfaf9a80274c2ba3845f4b3c1ea7d6c31dde))
* [#349](https://github.com/openfoodfacts/openfoodfacts-dart/issues/349) - removed irrelevant "create event" classes and methods ([#424](https://github.com/openfoodfacts/openfoodfacts-dart/issues/424)) ([242c944](https://github.com/openfoodfacts/openfoodfacts-dart/commit/242c94443971fd00bfea8488b72edb139be6d7ce))
* [#414](https://github.com/openfoodfacts/openfoodfacts-dart/issues/414) -  changed get request to post ([#415](https://github.com/openfoodfacts/openfoodfacts-dart/issues/415)) ([e478837](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e4788373a3c41d0b1e6278f53f14f750250f34a4))
* [#447](https://github.com/openfoodfacts/openfoodfacts-dart/issues/447) - new class "PageNumber" replacing  ambiguous "Page" parameter ([#449](https://github.com/openfoodfacts/openfoodfacts-dart/issues/449)) ([584dbcc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/584dbcc34d52d49c5652b3ddec7a163b0811466d))
* actually upload an image on a random product ([#419](https://github.com/openfoodfacts/openfoodfacts-dart/issues/419)) ([bad6238](https://github.com/openfoodfacts/openfoodfacts-dart/commit/bad62386f39a991f6e269e3842dc8e089eaa0aec))
* coordinates_image_size is no subtype of String ([#443](https://github.com/openfoodfacts/openfoodfacts-dart/issues/443)) ([9a66b95](https://github.com/openfoodfacts/openfoodfacts-dart/commit/9a66b95ed3ba3c98bdf4bd01ce035949a0cba9d5))
* getProductRaw tests ([#428](https://github.com/openfoodfacts/openfoodfacts-dart/issues/428)) ([e92a169](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e92a169e10c8c01efa46c0cf36b3debdd20afb1b))
* Removed deprecated Product field imgSmallUrl ([#448](https://github.com/openfoodfacts/openfoodfacts-dart/issues/448)) ([8bb9d97](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8bb9d9765a9c28d70be32625a0ef2a10d74d9632))
* send user credentials in POST requests, fixes [#420](https://github.com/openfoodfacts/openfoodfacts-dart/issues/420) ([#421](https://github.com/openfoodfacts/openfoodfacts-dart/issues/421)) ([0be7396](https://github.com/openfoodfacts/openfoodfacts-dart/commit/0be7396510a2b70cc2a15dae0429cfef030d807f))

## [1.14.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.13.0...v1.14.0) (2022-03-15)


### Features

* [#410](https://github.com/openfoodfacts/openfoodfacts-dart/issues/410) - refactored TaxonomyCountry with simplified fields ([#412](https://github.com/openfoodfacts/openfoodfacts-dart/issues/412)) ([dc77db3](https://github.com/openfoodfacts/openfoodfacts-dart/commit/dc77db313af4fa93e21aa4edc7ed7181a4e15e3b))
* Support for source fields in the Knowledge panel API ([#409](https://github.com/openfoodfacts/openfoodfacts-dart/issues/409)) ([6a065fd](https://github.com/openfoodfacts/openfoodfacts-dart/commit/6a065fdbd1834239758c4548566bc105a8034810))


### Bug Fixes

* [#407](https://github.com/openfoodfacts/openfoodfacts-dart/issues/407) - getProductList now works with unlimited number of barcodes ([#413](https://github.com/openfoodfacts/openfoodfacts-dart/issues/413)) ([fd7ddbc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/fd7ddbc99e5517c383d02dd45764f655bf8c95fa))
* [#410](https://github.com/openfoodfacts/openfoodfacts-dart/issues/410) - removed failing tests about TaxonomyCountry ([#411](https://github.com/openfoodfacts/openfoodfacts-dart/issues/411)) ([25f7a4b](https://github.com/openfoodfacts/openfoodfacts-dart/commit/25f7a4bbfc176028965de75f1ba255cd130b2a4f))
* changelog order ([#405](https://github.com/openfoodfacts/openfoodfacts-dart/issues/405)) ([ca4669c](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ca4669cb801621cb05e840ac6f0671d8a2b3418d))

## [1.13.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.12.0...v1.13.0) (2022-03-04)


### Features

* [#349](https://github.com/openfoodfacts/openfoodfacts-dart/issues/349) - added support for Events API ([#386](https://github.com/openfoodfacts/openfoodfacts-dart/issues/386)) ([ea79ad0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ea79ad0f3283c50ba54e1767bcece5761c57f939))
* [#379](https://github.com/openfoodfacts/openfoodfacts-dart/issues/379) - added packaging_text_XX ([#380](https://github.com/openfoodfacts/openfoodfacts-dart/issues/380)) ([cf492c5](https://github.com/openfoodfacts/openfoodfacts-dart/commit/cf492c54275424c184457884e951289512de3591))
* [#382](https://github.com/openfoodfacts/openfoodfacts-dart/issues/382) - added a "packaging" tag type ([#383](https://github.com/openfoodfacts/openfoodfacts-dart/issues/383)) ([4479956](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4479956ddf9c1ab97ef5214562a162dd7138a6ac))
* [#394](https://github.com/openfoodfacts/openfoodfacts-dart/issues/394) - additional "root" and "all" configurations for taxonomies ([#396](https://github.com/openfoodfacts/openfoodfacts-dart/issues/396)) ([4686ddb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4686ddbfffe4f063a2e259718386f689471e09dd))
* [#401](https://github.com/openfoodfacts/openfoodfacts-dart/issues/401) - added packaging taxonomy ([#402](https://github.com/openfoodfacts/openfoodfacts-dart/issues/402)) ([c7dbebe](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c7dbebec0b16026eae2f646cf36d1f34ea35c9f9))
* added the set of nutrient ids supported by Nutriments. ([#385](https://github.com/openfoodfacts/openfoodfacts-dart/issues/385)) ([bf9f79b](https://github.com/openfoodfacts/openfoodfacts-dart/commit/bf9f79bb12254efb255c9a43c46f6f76c583f32b))


### Bug Fixes

* successful unit tests ([#384](https://github.com/openfoodfacts/openfoodfacts-dart/issues/384)) ([ba2b731](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ba2b7311546400401c6ed8cb6370a2316e4fd690))

## [1.12.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.11.1...v1.12.0) (2022-02-02)


### Features

* [#348](https://github.com/openfoodfacts/openfoodfacts-dart/issues/348) - new methods getTaxonomyTranslationUri and getCrowdinUri ([#372](https://github.com/openfoodfacts/openfoodfacts-dart/issues/372)) ([057e0a3](https://github.com/openfoodfacts/openfoodfacts-dart/commit/057e0a30b6c824722c733c4d63ca63bd8cccc434))
* [#369](https://github.com/openfoodfacts/openfoodfacts-dart/issues/369) - more flexibility for product query version ([#374](https://github.com/openfoodfacts/openfoodfacts-dart/issues/374)) ([51fdebc](https://github.com/openfoodfacts/openfoodfacts-dart/commit/51fdebcc46b0fea4bba69cef50817da9b0ef970f))
* [#370](https://github.com/openfoodfacts/openfoodfacts-dart/issues/370) - added "uuid" to configuration ([#378](https://github.com/openfoodfacts/openfoodfacts-dart/issues/378)) ([2be52e0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/2be52e064c42c460ca453461e1ebdaece5b58177))
* [#370](https://github.com/openfoodfacts/openfoodfacts-dart/issues/370) - added app_name and app_version to http queries (as parameters) ([#376](https://github.com/openfoodfacts/openfoodfacts-dart/issues/376)) ([d4c6ef9](https://github.com/openfoodfacts/openfoodfacts-dart/commit/d4c6ef9f46eb8cf51e66d70f2b5838b8b8a8e12b))
* new method getProductString, api V0 and V2, new product and ingredient fields ([#371](https://github.com/openfoodfacts/openfoodfacts-dart/issues/371)) ([82547f6](https://github.com/openfoodfacts/openfoodfacts-dart/commit/82547f63a3c4e59cd6f30c1c018cf5c8d13d0b45))

### [1.11.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.11.0...v1.11.1) (2022-01-16)


### Bug Fixes

* Rename enum so it doesn't conflict with Size class from geometry.dart ([#366](https://github.com/openfoodfacts/openfoodfacts-dart/issues/366)) ([527b2e7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/527b2e7ea484839ccfc9bb6ffc812b3d966e0924))

## [1.11.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.10.0...v1.11.0) (2022-01-15)


### Features

* KP: Parse Size from server response ([#364](https://github.com/openfoodfacts/openfoodfacts-dart/issues/364)) ([3d402b7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/3d402b7d93e310ae8b31dd18b02b98db695dc9a1))

## [1.10.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.9.1...v1.10.0) (2022-01-13)


### Features

* new method "getOrderedNutrientsJsonString" ([#362](https://github.com/openfoodfacts/openfoodfacts-dart/issues/362)) ([516ccfa](https://github.com/openfoodfacts/openfoodfacts-dart/commit/516ccfa40063aa4d15d1e032438ea1073c945de6))

### [1.9.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.9.0...v1.9.1) (2022-01-08)


### Bug Fixes

* [#357](https://github.com/openfoodfacts/openfoodfacts-dart/issues/357) - all `Unit`s are now correctly saved ([#358](https://github.com/openfoodfacts/openfoodfacts-dart/issues/358)) ([9eb2872](https://github.com/openfoodfacts/openfoodfacts-dart/commit/9eb2872b0754c193b0c07f66f2da0331e4ffc23b))


## [1.9.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.8.1...v1.9.0) (2022-01-07)


### Features

* [#350](https://github.com/openfoodfacts/openfoodfacts-dart/issues/350) - new method getProductFreshness ([#351](https://github.com/openfoodfacts/openfoodfacts-dart/issues/351)) ([979c6af](https://github.com/openfoodfacts/openfoodfacts-dart/commit/979c6afca50aecfe58d0094f9873926dd0ce1fde))


### [1.8.1](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.8.0...v1.8.1) (2021-12-28)


### Bug Fixes

* Lowercased country code ([#343](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/343)) ([bdf6451](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/bdf645197a81e40c357bd126e09986d195f96e05))


## [1.8.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.7.0...v1.8.0) (2021-12-20)


### Features

* Initial support for Folksonomy Engine (Beta) ([#332](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/332)) ([f7b254e](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/f7b254e80a339c37ce85a1ad7d9f8bc9978be9d8))
* Added globalUser to OpenFoodAPIConfiguration ([#329](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/329)) ([e246d9e](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/e246d9ea34bc271bd0f6a5a507b3b44c4e492cc1))


### Bug Fixes

* Added missing product fields to ProductField enum ([#331](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/331)) ([4bbd66c](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/4bbd66c4d5b1b6e9be460029598125e0e519e2f1))
* Don't pass country code if it's null ([#324](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/324)) ([5f9447c](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/5f9447c474e1a8a5ea9dc18233b2df8374c7bd6c))

## [1.7.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.6.0...v1.7.0) (2021-12-15)


### Features

* [#306](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/306) - unselect product image, added "user" parameter to WRITE methods ([#319](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/319)) ([1c82e33](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/1c82e33a313afd3c4908cf95f96d58f7f738ca1e))



## [1.6.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.5.0...v1.6.0) (2021-12-14)


### Features

* [#307](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/307) - added 21 enum values for advanced search parameters ([#313](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/313)) ([55f3fa5](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/55f3fa583a535ec842db87067019ed2933f75a78))
* Allow to get OpenFoodFactsCountry from countryCode ([#314](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/314)) ([8b6c9bc](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/8b6c9bc956b716fea16ffc198f62421973665caf))


### Bug Fixes

* Parsing of Grade Json field ([#311](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/311)) ([2da4d27](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/2da4d276d5e94d3a1d92a35105d8d1c4a287709c))

## [1.5.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.4.0...v1.5.0) (2021-12-09)

### Features

* [#301](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/301) - new method getProductUri ([#302](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/302)) ([85169f0](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/85169f083ad7bc1c83c67e817de32a942700eb92))
* [#304](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/304) - new method setProductImageAngle and setProductImageCrop ([#309](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/309)) ([c69f3f6](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/c69f3f639f47291a007185c59c89b652bbf52098))


## [1.4.0](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.3.9...v1.4.0) (2021-11-19)

### Features

* [#233](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/233) - new class OpenFoodFactsCountry, clearer than "cc" ([#292](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/292)) ([3dda3f4](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/3dda3f46e290c71bb6cb23e553163d62ea9159fb))

### [1.3.9](https://www.github.com/openfoodfacts/openfoodfacts-dart/compare/v1.3.8...v1.3.9) (2021-11-17)

### Features

* Add a taxonomy API for labels ([#277](https://github.com/openfoodfacts/openfoodfacts-dart/pull/277)) 
* Add additives, countries, and languages taxonomy APIs ([#278](https://github.com/openfoodfacts/openfoodfacts-dart/pull/278)) 
* Add queries to get the roots from the server ([#287](https://github.com/openfoodfacts/openfoodfacts-dart/pull/287)) 
* Add support for the new "Image Refresh" API ([#289](https://github.com/openfoodfacts/openfoodfacts-dart/pull/289)) 
* Add nutrient order and list ([#272](https://github.com/openfoodfacts/openfoodfacts-dart/pull/272)) 
* Added eco-score and nutri-score categories (ProductImprovement) ([#191](https://github.com/openfoodfacts/openfoodfacts-dart/pull/191)) 

### Bug Fixes

* Update to latest KnowledgePanel API changes  ([#294](https://www.github.com/openfoodfacts/openfoodfacts-dart/issues/294)) ([5163db5](https://www.github.com/openfoodfacts/openfoodfacts-dart/commit/5163db593f89631e922c3c2085809ef60b3a42d9))
* Add additives, countries, and languages taxonomy APIs ([#274](https://github.com/openfoodfacts/openfoodfacts-dart/pull/274)) 
* Allow to send deviceId to InsightAnnotations API and allow anonymous user ([#286](https://github.com/openfoodfacts/openfoodfacts-dart/pull/286))  

## [1.3.8] - 22.10.2021
- More updates to KnowledgePanel APIs
## [1.3.7] - 12.10.2021
- Update KnowledgePanel API to comply to the latest Backend changes.
## [1.3.6] - 10.10.2021
- Fix issue with `Nutriments` JSON conversion related to microgram units
- Support password reset
- Add `page`, `pageSize` and `sortOption` in `ProductListQueryConfiguration`
## [1.3.5] - 26.09.2021
- Improve wrong username/password error messages in `Status`
## [1.3.4] - 24.09.2021
- Add ability to check whether a product attribute is marked as important in user's personal preferences
## [1.3.3] - 16.09.2021
- Add ability to request the `product_name_languages` and `ingredients_text_languages` fields
- Introduce `OpenFoodAPISettings` to improve API configuration support
- Allow user agent to be passed via HTTP header
- Added `getProductImprovements` to the product model
- Add missing `carbohydratesUnit` and `fatUnit` fields in the `Nutriements` class
- Fix alchohol tags in the `Nutriments` class
- Fix write API for nutrient fields
## [1.3.2] - 25.07.2021
- Fixed completely toJson and fromJson for the fields in multiple languages
## [1.3.1] - 22.07.2021
- Fixed toJson and fromJson for the fields in multiple languages
## [1.3.0] - 21.07.2021
- Added explicit parameter WithoutAdditives to replace ContainsAdditives (deprecated)
- Added new InvalidBarcodes class
- Simplified product search tests
- Added several nutrients
- Added ability to request and set multiple translated product fields at once (breaking change)
- Added support for product list queries
- Added PnnsGroup2 filter to ProductSearchQueryConfiguration, deprecated PnnsGroupQueryConfiguration
- Deprecated useless parameters OutputFormat and SearchSimple
- Added new feature to get the Ecoscore description in HTML
- Added comments to several classes and methods

## [1.2.0] - 08.07.2021
- `product_name_de`, `productNameEN`, ... are now deprecated. Use `productNameTranslated` instead
- Added the `agribalyse` field in `EcoscoreData`
- Added support for the `missing_data_warning` field, to inform users that the ecoscore may be improved
- Added support for user management
- Added [dart-doc documentation](https://openfoodfacts.github.io/openfoodfacts-dart/)
- Added suggestion for states, languages, labels, categories and more.

## [1.1.0-beta] - 30.03.2021
- Renamed SendImage imageUrl parameter to imageUri as it is an Uri (breaking change)
- New product preferences and matching classes for personalized search (thanks to monsieurtanuki)
- Added missing values for IngredientsAnalysisTags, and renamed some values to match API names (breaking change)
- Fixed image upload and added PACKAGING image type

## [1.0.2-beta] - 11.03.2021
- Added support for new fields (images URLs, vegan/vegetarian/from palm oil ingredients, categories, labels and packaging)
- Fixed test mode for addProductImage

## [1.0.1-beta] - 08.03.2021
- API method for searching products does not require a user being passed

## [1.0.0-beta] - 07.03.2021
- Migrated SDK to null safety
- Updated test instructions in README.md
- Improved Github Action validation

## [0.3.15+3] - 01.03.2021
- Greatly improved code quality and readability

## [0.3.15+2] - 08.02.2021
- fix additional issue with EcoScoreData JSON generation
- use Github action to test changes
- fix test output (avoid chatty tests)
- add support for OCR ingredients

## [0.3.15+1] - 04.02.2021
- fix issue with images URLs

## [0.3.15] - 04.02.2021
- Refactored tests to use the Open Food Facts test database (thanks to Mohamed Boussaid)
- Added packaging image type
- Allow setting the country code cc field
- Added countries and countries tags to Product (thanks to Mohamed Boussaid)
- Allow anonymous photo upload
- Fixed product JSON generation for Eco-Score data (thanks to Peter Tran-Jørgensen)

## [0.3.14+1] - 07.01.2021
- Refactored Attribute & AttributeGroup
- Removed ProductFields.ECOSCORE_ALPHA as deprecated

## [0.3.14] - 01.01.2021
- Added support for Ecoscore (thanks to Frédéric Julian)

## [0.3.13+2] - 2.12.2020
- nullable product name hotfix

## [0.3.13+1] - 24.11.2020
- product upload hotfix

## [0.3.13] - 20.11.2020
- Extended micronutrients support (thanks to Ilia (Elliot) Tikhomirov)
- product attribute: lastModified

## [0.3.12+2] - 26.10.2020
- Fixed save product. NULL values won't be sent.

## [0.3.12+1] - 27.09.2020
- Fixed image upload

## [0.3.12] - 27.09.2020
- Added AttributeGroups

## [0.3.11+1] - 19.09.2020
- Fixed SearchResult

## [0.3.11] - 19.09.2020
- Added userPreferences
- Product image upload fixed (Thanks to Peter Tran-Jørgensen)

## [0.3.10] - 02.08.2020
- Added energyKcal and energyKcal100g

## [0.3.9] - 30.07.2020
- Added EnvironmentImpactLevels
- Rewrote NutrientLevels

## [0.3.8] - 27.07.2020
- Fixed typos in PnnsGroup2 ids

## [0.3.7] - 17.07.2020
- Added allergens
- Introduced PNNS groups and PnnsGroup2 queries

## [0.3.6] - 12.07.2020
- fixed Json product generation (additives, selectedImages)

## [0.3.5] - 28.06.2020
- fixed servingQuantity issue introduced in 0.3.4

## [0.3.4] - 25.06.2020
- selectedImages toJson implementation
- codebase improvements

## [0.3.3] - 25.06.2020
- ingredient percentage parsing fixed

## [0.3.2] - 19.05.2020
- dart:ui - dependencies removed
- search result decoding and parsing errors fixed

## [0.3.1] - 30.04.2020
- Added documentation form version 0.3.0
- Updated README.md

## [0.3.0] - 30.04.2020
- Support for more than 180 languages
- New query / search principle - _ProductQueryConfiguration_ : 
In order to optimize the queries you can now set the return language and fields list through _ProductQueryConfiguration_ (Default Behaviour)
- _getProductRaw()_ is still available (Old Behaviour)

## [0.2.1] - 14.04.2020
- expose robotoff and helper classes

## [0.2.0] - 13.04.2020
- added robotoff support, new service methods:
  *getProductInsights()*,
  *getRobotoffQuestionsForProduct()*,
  *getRandomRobotoffQuestion()*,
  *postInsightAnnotation()*,
  *getIngredientSpellingCorrection()*,
- added images field
- added documentation.md

## [0.1.16] - 05.03.2020
- added brandsTags to get brands as a list

## [0.1.15] - 24.02.2020
- added serving size and nutriment serving sizes

## [0.1.14] - 25.01.2020
- search products by tags
- search products with / without additives
- search products with keywords

## [0.1.13] - 24.11.2019
- added support for Spanish

## [0.1.12] - 18.11.2019
- nutrient levels added

## [0.1.11] - 9.10.2019
- additives management implemented
- added Nutriscore to product
- bugfix: ingredientText language dependent

## [0.1.10] - 5.10.2019
- nutriments management implemented

## [0.1.9] - 21.09.2019
- get product image by field, size and language

## [0.1.8] - 13.09.2019
- http: 0.12.0

## [0.1.7] - 13.09.2019
- Bugfix: search result page - json parse error fixed (string vs. int)
- json_annotation: 3.0.0
- build_runner: 1.6.9
- json_serializable: 3.2.2

## [0.1.6] - 06.06.2019
- Bugfix: ingredients percent json parse error fixed (string vs. int)

## [0.1.5] - 28.05.2019
- *getProduct()* fixed null-pointer for non existing product. 
- *searchProducts()* english URL now working. (-> world)

## [0.1.4] - 19.05.2019
- *getProduct()* chooses a language dependent host (world, de, ..)
- Bugfix: *getProduct()* won't fail if no images are provided 

## [0.1.3] - 5.05.2019
- *searchProducts()* with language support

## [0.1.2] - 5.05.2019
- Ingredients.dart more type safe (THX to dynamic) 

## [0.1.1] - 5.05.2019
- class SearchResult now visible

## [0.1.0] - 4.05.2019.
- service method *searchProducts()* implemented. 

## [0.0.10] - 28.03.2019
the test package dependency has been moved to flutter_test.

## [0.0.9] - 16.03.2019.
dependency version upgrade to:
- json_annotation: 2.0.0
- build_runner: 1.2.6
- json_serializable: 2.0.2

## [0.0.8] - 16.11.2018.
- getProduct() provides ingredients and images for a given language.
- getProductRaw() provides *all* data fields without preparation.

## [0.0.6] - 27.10.2018.
- set dependency versions as range

## [0.0.5] - 25.10.2018.
- upgrade of http 0.12.0
- upgrade of build_runner 1.0.0

## [0.0.4] - 16.10.2018.
- class *Image* changed to *ProductImage* for a easier namespace resolving.

## [0.0.3] - 12.10.2018.
- model of selected product images changed.

## [0.0.2] - 3.10.2018.

- Service *saveProduct()* can handle to add and to edit a product.
- Added traces to a product

## [0.0.1] - 18.09.2018.

initial version with these API services:
- add a new product
- add a new product image
- get an existing product
