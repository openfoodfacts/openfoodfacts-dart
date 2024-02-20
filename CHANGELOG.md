# Changelog

## [3.4.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v3.3.3...v3.4.0) (2024-02-06)


### Features

* 773 - new method "getProductNameBrandQuantity" ([#844](https://github.com/openfoodfacts/openfoodfacts-dart/issues/844)) ([2167bf9](https://github.com/openfoodfacts/openfoodfacts-dart/commit/2167bf9087c3583f5aaa35116705ff09647b5573))
* 878 - added the "obsolete" product field ([#879](https://github.com/openfoodfacts/openfoodfacts-dart/issues/879)) ([4cc49cd](https://github.com/openfoodfacts/openfoodfacts-dart/commit/4cc49cd67cb6b7f98291f86888deee85def9a60e))
* autocomplete manager for both TagTypes and TaxonomyNames ([#851](https://github.com/openfoodfacts/openfoodfacts-dart/issues/851)) ([6bb8deb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/6bb8deb543adc45031e2de749060267174c48b7a))


### Bug Fixes

* unit tests about autocomplete ([#868](https://github.com/openfoodfacts/openfoodfacts-dart/issues/868)) ([7a1f4e6](https://github.com/openfoodfacts/openfoodfacts-dart/commit/7a1f4e639573e182e2a1dff5098e5741d7fc057c))

## [3.3.3](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v3.3.2...v3.3.3) (2024-01-31)


### Bug Fixes

* nutriment persize serving ([#873](https://github.com/openfoodfacts/openfoodfacts-dart/issues/873)) ([31f9fab](https://github.com/openfoodfacts/openfoodfacts-dart/commit/31f9fab611e58e130739a81a28b7536aff863679))
* added `added-sugars` nutrient ([#862](https://github.com/openfoodfacts/openfoodfacts-dart/issues/862))

## [3.3.2](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v3.3.1...v3.3.2) (2024-01-12)


### Bug Fixes

* unit test value + better json decode ([#865](https://github.com/openfoodfacts/openfoodfacts-dart/issues/865)) ([565c0fa](https://github.com/openfoodfacts/openfoodfacts-dart/commit/565c0fa3b2b859dcef282eb19336a8897c591c63))

## [3.3.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v3.3.0...v3.3.1) (2024-01-07)


### Bug Fixes

* 862 - added 18 nutrients ([#863](https://github.com/openfoodfacts/openfoodfacts-dart/issues/863)) ([dff0535](https://github.com/openfoodfacts/openfoodfacts-dart/commit/dff0535810baa74a97be278dfd19ff8d732d3145))

## [3.3.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v3.2.1...v3.3.0) (2023-12-24)


### Features

* 831 - Open Prices API - "get prices" ([#845](https://github.com/openfoodfacts/openfoodfacts-dart/issues/845)) ([eaeb1aa](https://github.com/openfoodfacts/openfoodfacts-dart/commit/eaeb1aa3abd427e524c1f85b560b97921fdfab05))
* simplified access to raw product images ([#839](https://github.com/openfoodfacts/openfoodfacts-dart/issues/839)) ([3350251](https://github.com/openfoodfacts/openfoodfacts-dart/commit/3350251481d17fccbd6b60ba8a8c95f021da6f10))


### Bug Fixes

* If `product.images` is `null`, `getProductImageIds`shouldn't crash ([#857](https://github.com/openfoodfacts/openfoodfacts-dart/issues/857)) ([02abab3](https://github.com/openfoodfacts/openfoodfacts-dart/commit/02abab364146cd8493f941ac861db907cf301359))
* unit test with updated expected values ([#858](https://github.com/openfoodfacts/openfoodfacts-dart/issues/858)) ([0482f63](https://github.com/openfoodfacts/openfoodfacts-dart/commit/0482f6342ea96f44cd988b44e82c20a3aeffbcff))

## [3.2.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v3.2.0...v3.2.1) (2023-12-03)


### Bug Fixes

* 5 topics ([#846](https://github.com/openfoodfacts/openfoodfacts-dart/issues/846)) ([44812d4](https://github.com/openfoodfacts/openfoodfacts-dart/commit/44812d485cca0bc989e8e7dd8bf1c432a1e91c3e))

## [3.2.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v3.1.0...v3.2.0) (2023-11-28)


### Features

* 620 - autocomplete for all taxonomy names and fuzziness levels ([#835](https://github.com/openfoodfacts/openfoodfacts-dart/issues/835)) ([046c418](https://github.com/openfoodfacts/openfoodfacts-dart/commit/046c4189a116fdd20b2e2100def665f07094a786))
* 620 - Elastic Search autocomplete for categories ([#834](https://github.com/openfoodfacts/openfoodfacts-dart/issues/834)) ([1672f1a](https://github.com/openfoodfacts/openfoodfacts-dart/commit/1672f1a01fc8055866ee30b1594940fda589d10b))
* 836 - localizable and clickable server error ([#837](https://github.com/openfoodfacts/openfoodfacts-dart/issues/837)) ([a40101c](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a40101c2b0c0b8aefe2f761bf4718be31022c84b))
* new field pageCount for searchResult ([#823](https://github.com/openfoodfacts/openfoodfacts-dart/issues/823)) ([1d88bbf](https://github.com/openfoodfacts/openfoodfacts-dart/commit/1d88bbfac3411bfe150745034a4e28067628ac0f))
* new localized product fields for generic name ([#828](https://github.com/openfoodfacts/openfoodfacts-dart/issues/828)) ([a98cfcb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a98cfcb3d1e127b5a57d6a7e70db163906ac2661))


### Bug Fixes

* 829 - no more crash if the user name is not ASCII/ISO-8859-1 ([#830](https://github.com/openfoodfacts/openfoodfacts-dart/issues/830)) ([8a23aee](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8a23aeef41307fd85d5f119da0fd60470b6d39db))

## [3.1.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v3.0.0...v3.1.0) (2023-10-28)


### Features

* 810 - 6 new localized product fields ([#811](https://github.com/openfoodfacts/openfoodfacts-dart/issues/811)) ([df85a38](https://github.com/openfoodfacts/openfoodfacts-dart/commit/df85a38fac6bf9a7fac047d227a05af09d91ebff))


### Bug Fixes

* 816 - use localized versions of productName and ingredientsText ([#817](https://github.com/openfoodfacts/openfoodfacts-dart/issues/817)) ([60f7d1e](https://github.com/openfoodfacts/openfoodfacts-dart/commit/60f7d1eb9679e226ec1f56e53ba6d4966bfa93f4))

## [3.0.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.10.1...v3.0.0) (2023-09-30)


### ⚠ BREAKING CHANGES

* 801 - more url flexibility with non static UriHelper ([#803](https://github.com/openfoodfacts/openfoodfacts-dart/issues/803))
* fix for the uk/gb country code case ([#795](https://github.com/openfoodfacts/openfoodfacts-dart/issues/795))
* A valid user agent is now required ([#790](https://github.com/openfoodfacts/openfoodfacts-dart/issues/790))
* removed deprecated code ([#791](https://github.com/openfoodfacts/openfoodfacts-dart/issues/791))
* 742 - robotoff - countries instead of country ([#792](https://github.com/openfoodfacts/openfoodfacts-dart/issues/792))

### Features

* 69 - method to get a server type from its off tag ([#796](https://github.com/openfoodfacts/openfoodfacts-dart/issues/796)) ([0bd8f90](https://github.com/openfoodfacts/openfoodfacts-dart/commit/0bd8f90484ce1aa6d054162ffc9ddbacf1cc0029))
* 801 - more url flexibility with non static UriHelper ([#803](https://github.com/openfoodfacts/openfoodfacts-dart/issues/803)) ([7753cb0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/7753cb063e04b923a7d7f5fa0d54a9a2b3f7575f))
* 802 - new "get product" method specific to OBF OPF OPFF ([#806](https://github.com/openfoodfacts/openfoodfacts-dart/issues/806)) ([e824de2](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e824de2d334ab99e3d214759314970ffcb9c0644))
* A valid user agent is now required ([#790](https://github.com/openfoodfacts/openfoodfacts-dart/issues/790)) ([a26ec2a](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a26ec2adaf5b7a1773b9c93ccf7b5e274b6100c5))
* insight - method to get an insight annotation from an int value ([#797](https://github.com/openfoodfacts/openfoodfacts-dart/issues/797)) ([fdc6381](https://github.com/openfoodfacts/openfoodfacts-dart/commit/fdc638151753ab64ed2d8dd497b7794c5563c4f5))
* method to get the Uri host (e.g. for ping) ([#800](https://github.com/openfoodfacts/openfoodfacts-dart/issues/800)) ([081f0b9](https://github.com/openfoodfacts/openfoodfacts-dart/commit/081f0b9921ee0128cf7b91c8525fc1599f3d9a76))
* product "getAttribute" method ([#799](https://github.com/openfoodfacts/openfoodfacts-dart/issues/799)) ([a179dc5](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a179dc516ad1dcc75eda4f70eb4d86a535cdbcfa))
* specified minimum size for uploaded images (for pre-checks) ([#798](https://github.com/openfoodfacts/openfoodfacts-dart/issues/798)) ([3cf14f2](https://github.com/openfoodfacts/openfoodfacts-dart/commit/3cf14f2c624a97c3c67b4d7c379d93f0915042bd))


### Bug Fixes

* 742 - robotoff - countries instead of country ([#792](https://github.com/openfoodfacts/openfoodfacts-dart/issues/792)) ([8582519](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8582519b3dcc8e7341ab46ebb4d5c1adf95cef6b))
* fix for the uk/gb country code case ([#795](https://github.com/openfoodfacts/openfoodfacts-dart/issues/795)) ([fc2e907](https://github.com/openfoodfacts/openfoodfacts-dart/commit/fc2e907a6217bad13522438a5eb30b2d74413c07))
* removed deprecated code ([#791](https://github.com/openfoodfacts/openfoodfacts-dart/issues/791)) ([8d01168](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8d011687036e0b3ae622c0a354cefbc6c39a27f3))

## [2.10.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.10.0...v2.10.1) (2023-08-17)


### Bug Fixes

* reset password checks with languages ([#787](https://github.com/openfoodfacts/openfoodfacts-dart/issues/787)) ([0fee449](https://github.com/openfoodfacts/openfoodfacts-dart/commit/0fee44994f1e236748ccec989f87053b5011e972))

## [2.10.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.9.0...v2.10.0) (2023-08-12)


### Features

* Reset password: allow to receive "translated" email ([#781](https://github.com/openfoodfacts/openfoodfacts-dart/issues/781)) ([a82a699](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a82a699110f79a0fc0ab70d9d1267d5cdd6332dc))


### Bug Fixes

* unit test values ([#783](https://github.com/openfoodfacts/openfoodfacts-dart/issues/783)) ([61c1ec1](https://github.com/openfoodfacts/openfoodfacts-dart/commit/61c1ec17903775e6873d917a85e3da0bdeff71e6))

## [2.9.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.8.0...v2.9.0) (2023-08-09)


### Features

* Multipart requests: ensure to always get the full response ([#779](https://github.com/openfoodfacts/openfoodfacts-dart/issues/779)) ([e53c7fd](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e53c7fd91d67712f065be54974d09b8ded8b912c))

## [2.8.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.7.4...v2.8.0) (2023-08-08)


### Features

* Registration/Password lost: better catch 504 errors from the server ([#777](https://github.com/openfoodfacts/openfoodfacts-dart/issues/777)) ([8cd4a35](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8cd4a35c6f97678a0647f2c3b262df4ef11ca77c))


### Bug Fixes

* password reset not working ([#774](https://github.com/openfoodfacts/openfoodfacts-dart/issues/774)) ([8792510](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8792510b1898302c49955131fd34164887ca2296))

## [2.7.4](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.7.3...v2.7.4) (2023-08-03)


### Bug Fixes

* 764 - upgraded sdk and http dependency ([#770](https://github.com/openfoodfacts/openfoodfacts-dart/issues/770)) ([adcd147](https://github.com/openfoodfacts/openfoodfacts-dart/commit/adcd147b22181847b5f4fcab38b4b1dc56250af5))

## [2.7.3](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.7.2...v2.7.3) (2023-07-20)


### Bug Fixes

* issue with converting LocalizedTags to JSON ([#766](https://github.com/openfoodfacts/openfoodfacts-dart/issues/766)) ([80c3ddb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/80c3ddb3b5fa68643b36b685a80ce01f13130f5b))

## [2.7.2](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.7.1...v2.7.2) (2023-07-19)


### Bug Fixes

* issue with JSON conversion of packagings data ([#762](https://github.com/openfoodfacts/openfoodfacts-dart/issues/762)) ([01c1d7b](https://github.com/openfoodfacts/openfoodfacts-dart/commit/01c1d7b29da50dbaf17a0a375a54c34e7eee30a4))

## [2.7.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.7.0...v2.7.1) (2023-07-12)


### Bug Fixes

* fixed unit tests ([#755](https://github.com/openfoodfacts/openfoodfacts-dart/issues/755)) ([60bd0ee](https://github.com/openfoodfacts/openfoodfacts-dart/commit/60bd0ee49a0e5fa6279a2f0a0135d43e155f9711))

## [2.7.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.6.0...v2.7.0) (2023-07-12)


### Features

* Allow to pass `insight_types` to `api/v1/questions/$barcode` ([#748](https://github.com/openfoodfacts/openfoodfacts-dart/issues/748)) ([cf9dd14](https://github.com/openfoodfacts/openfoodfacts-dart/commit/cf9dd14edf7a3a81f695ec6aa5b5d9ce919fd2c6))
* Allow to pass a country and/or a language to the `register` user method ([#754](https://github.com/openfoodfacts/openfoodfacts-dart/issues/754)) ([05c5c12](https://github.com/openfoodfacts/openfoodfacts-dart/commit/05c5c126f9c1fe79599ffc44cc1abbeb48d47a94))


### Bug Fixes

* get user products tests ([#749](https://github.com/openfoodfacts/openfoodfacts-dart/issues/749)) ([38c4695](https://github.com/openfoodfacts/openfoodfacts-dart/commit/38c4695b3a6460cdcacc93e86507e41c826d5737))
* ImageHelper refactoring ([#751](https://github.com/openfoodfacts/openfoodfacts-dart/issues/751)) ([ce3f319](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ce3f319588ae896ae753e3c40b92983855582393))

## [2.6.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.5.2...v2.6.0) (2023-06-14)


### Features

* 741 - new parameters for Robotoff ([#743](https://github.com/openfoodfacts/openfoodfacts-dart/issues/743)) ([77c01de](https://github.com/openfoodfacts/openfoodfacts-dart/commit/77c01de3efdceceee63e95d8a7bd8872bea36563))

## [2.5.2](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.5.1...v2.5.2) (2023-06-03)


### Bug Fixes

* "InsightAnnotation" with better enum syntax ([#737](https://github.com/openfoodfacts/openfoodfacts-dart/issues/737)) ([30601b1](https://github.com/openfoodfacts/openfoodfacts-dart/commit/30601b19bd321c2d35ea1cf4745fc542aa96bc8c))
* new "KP action" enum ([#730](https://github.com/openfoodfacts/openfoodfacts-dart/issues/730))

## [2.5.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.5.0...v2.5.1) (2023-05-21)


### Bug Fixes

* typo for mono and poly unsaturated fat tags ([#732](https://github.com/openfoodfacts/openfoodfacts-dart/issues/732)) ([04b0f16](https://github.com/openfoodfacts/openfoodfacts-dart/commit/04b0f16b855fbdf3d52794756e139519ee4bc1c5))

## [2.5.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.4.0...v2.5.0) (2023-04-16)


### Features

* 719 - Suggestion Manager with suggestions for the latest input ([#720](https://github.com/openfoodfacts/openfoodfacts-dart/issues/720)) ([5a31a09](https://github.com/openfoodfacts/openfoodfacts-dart/commit/5a31a09e43d9291a071cc51d4bf885f6655e76a9))


### Bug Fixes

* 715 - downgraded "path" in order to match "flutter_test" ([#725](https://github.com/openfoodfacts/openfoodfacts-dart/issues/725)) ([58d9a10](https://github.com/openfoodfacts/openfoodfacts-dart/commit/58d9a10dffc07f17bc9368fe345f5266631a0218))
* Refactor Robotoff methods ([#723](https://github.com/openfoodfacts/openfoodfacts-dart/issues/723)) ([7a71cbb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/7a71cbb4e4cbfb0e4575f706265699f8302e923a))
* robotoff deprecated method calls in tests ([#724](https://github.com/openfoodfacts/openfoodfacts-dart/issues/724)) ([1cc8f18](https://github.com/openfoodfacts/openfoodfacts-dart/commit/1cc8f18d1d85230bfd88b1a91f43384b45dccd26))

## [2.4.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.3.1...v2.4.0) (2023-03-08)


### Features

* 557 - added 6 product fields ([#709](https://github.com/openfoodfacts/openfoodfacts-dart/issues/709)) ([2cb48b1](https://github.com/openfoodfacts/openfoodfacts-dart/commit/2cb48b1da481435b3cbdd75c470522c7b9c187f2))


### Bug Fixes

* 712 - optional User parameter for get random robotoff questions ([#713](https://github.com/openfoodfacts/openfoodfacts-dart/issues/713)) ([8ff23d2](https://github.com/openfoodfacts/openfoodfacts-dart/commit/8ff23d2bc2242b83e94b5cc3f60b28da373eb7d2))

## [2.3.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.3.0...v2.3.1) (2023-02-18)


### Bug Fixes

* rollback to dart 2.17 / flutter 3.0.5 ([#705](https://github.com/openfoodfacts/openfoodfacts-dart/issues/705)) ([5c15fd0](https://github.com/openfoodfacts/openfoodfacts-dart/commit/5c15fd04f58d4169eaa2650f74b72fef70ede697))

## [2.3.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.2.1...v2.3.0) (2023-02-16)


### Features

* 695 - New API V3 suggestions for taxonomies ([#696](https://github.com/openfoodfacts/openfoodfacts-dart/issues/696)) ([c0ffe94](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c0ffe9412f0ab3da411c0dbcbd33c15e589d3bfe))
* 699 - new class MatchedScoreV2 with better perf than MatchedProductV2 ([#702](https://github.com/openfoodfacts/openfoodfacts-dart/issues/702)) ([5a3dba9](https://github.com/openfoodfacts/openfoodfacts-dart/commit/5a3dba918df6a424832069123bcca97e20ea23f0))

## [2.2.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.2.0...v2.2.1) (2023-01-27)


### Bug Fixes

* 691 - implemented "imagesToJson" ([#693](https://github.com/openfoodfacts/openfoodfacts-dart/issues/693)) ([316b19d](https://github.com/openfoodfacts/openfoodfacts-dart/commit/316b19d2e5f0de51ee74c87e732fece171120082))

## [2.2.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.1.2...v2.2.0) (2023-01-26)


### Features

* 688 - new method "getProductImageIds" ([#689](https://github.com/openfoodfacts/openfoodfacts-dart/issues/689)) ([71e4067](https://github.com/openfoodfacts/openfoodfacts-dart/commit/71e40678ccdfbf4dd375d96b568dc7775b5bbb0c))

## [2.1.2](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.1.1...v2.1.2) (2023-01-09)


### Bug Fixes

* correct spelling of User-Agent ([#686](https://github.com/openfoodfacts/openfoodfacts-dart/issues/686)) ([67f1583](https://github.com/openfoodfacts/openfoodfacts-dart/commit/67f15830fb5340998b092a277736750430437e4d))

## [2.1.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.1.0...v2.1.1) (2023-01-09)


### Bug Fixes

* more read-only tests on PROD env ([#683](https://github.com/openfoodfacts/openfoodfacts-dart/issues/683)) ([cd5cf06](https://github.com/openfoodfacts/openfoodfacts-dart/commit/cd5cf06835f9bc129fb3b78a24c336f5f9f970b6))

## [2.1.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.0.1...v2.1.0) (2023-01-05)


### Features

* Start new documentation ([Check out here](https://github.com/openfoodfacts/openfoodfacts-dart#readme)) ([#663](https://github.com/openfoodfacts/openfoodfacts-dart/issues/663)) ([7d12409](https://github.com/openfoodfacts/openfoodfacts-dart/commit/7d124091488698cc975d26550869f14604d9bbfb))


### Bug Fixes

* docs for user data query ([#680](https://github.com/openfoodfacts/openfoodfacts-dart/issues/680)) ([fcb0fc7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/fcb0fc7156aa149cc6b6183e2528c6e602ab36e0))
* fixed lint error ([#674](https://github.com/openfoodfacts/openfoodfacts-dart/issues/674)) ([c947420](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c94742001d627823afc2c841697f4d1d46540522))

## [2.0.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v2.0.0...v2.0.1) (2023-01-03)


### Bug Fixes

* 643 - updated the copyright year in the LICENSE ([#672](https://github.com/openfoodfacts/openfoodfacts-dart/issues/672)) ([a34ab62](https://github.com/openfoodfacts/openfoodfacts-dart/commit/a34ab62be4df426baff858f091d30ae8f0f3c789))

## [2.0.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.30.1...v2.0.0) (2023-01-01)


### ⚠ BREAKING CHANGES

* 658 - api version is now required for barcode and search queries ([#667](https://github.com/openfoodfacts/openfoodfacts-dart/issues/667))
* 450 - finalizing the breaking changes ([#656](https://github.com/openfoodfacts/openfoodfacts-dart/issues/656))
* 450 - import only "openfoodfacts.dart"; all code in "src" folder ([#655](https://github.com/openfoodfacts/openfoodfacts-dart/issues/655))
* 450 - Name source files using "lowercase_with_underscores" ([#653](https://github.com/openfoodfacts/openfoodfacts-dart/issues/653))

### Features

* 450 - import only "openfoodfacts.dart"; all code in "src" folder ([#655](https://github.com/openfoodfacts/openfoodfacts-dart/issues/655)) ([d05d49c](https://github.com/openfoodfacts/openfoodfacts-dart/commit/d05d49c9d058591e8f6b97530e1ce91e8b7b03b8))
* 450 - Name source files using "lowercase_with_underscores" ([#653](https://github.com/openfoodfacts/openfoodfacts-dart/issues/653)) ([cc4eb2c](https://github.com/openfoodfacts/openfoodfacts-dart/commit/cc4eb2cd2fffb88945270b74ab08334f74667354))
* 659 - support of product field "packagingsComplete" ([#664](https://github.com/openfoodfacts/openfoodfacts-dart/issues/664)) ([ddd61a3](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ddd61a37662936798951ca82e37ba0f40ca23c51))
* 662 - new packaging fields "quantityPerUnit" and weightMeasured" ([#665](https://github.com/openfoodfacts/openfoodfacts-dart/issues/665)) ([c5335b7](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c5335b7b404dc0b48dd1e0eea73aa39b8942a0de))


### Bug Fixes

* 617 - user related queries now support api v3 ([#666](https://github.com/openfoodfacts/openfoodfacts-dart/issues/666)) ([11f678a](https://github.com/openfoodfacts/openfoodfacts-dart/commit/11f678a2c4377d347e1575d2b604929c5e2b3275))
* 650 - less server demanding nova integration test ([#668](https://github.com/openfoodfacts/openfoodfacts-dart/issues/668)) ([b6379ce](https://github.com/openfoodfacts/openfoodfacts-dart/commit/b6379ce90bbfce994102c7dcd96632139f3959dc))


### Code Refactoring

* 450 - finalizing the breaking changes ([#656](https://github.com/openfoodfacts/openfoodfacts-dart/issues/656)) ([c8e8e37](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c8e8e373fee914b397eee6c8764bd094f9f086b1))
* 658 - api version is now required for barcode and search queries ([#667](https://github.com/openfoodfacts/openfoodfacts-dart/issues/667)) ([c7f3b1d](https://github.com/openfoodfacts/openfoodfacts-dart/commit/c7f3b1daeded3c4eb8429657b94aadd0de086290))

## [1.30.1](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.30.0...v1.30.1) (2022-12-25)


### Bug Fixes

* 548 - "LICENSE" refactoring ([#651](https://github.com/openfoodfacts/openfoodfacts-dart/issues/651)) ([ce2b531](https://github.com/openfoodfacts/openfoodfacts-dart/commit/ce2b53103f6916bf0e46aab661c603195e6b364e))

## [1.30.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.29.0...v1.30.0) (2022-12-25)


### Features

* 539 - specific test for nova group filter ([#646](https://github.com/openfoodfacts/openfoodfacts-dart/issues/646)) ([44dfd2d](https://github.com/openfoodfacts/openfoodfacts-dart/commit/44dfd2da8025e480b0c0f7ec486184476f13c134))
* 539 - taxonomy for Nova groups ([#645](https://github.com/openfoodfacts/openfoodfacts-dart/issues/645)) ([5bf2959](https://github.com/openfoodfacts/openfoodfacts-dart/commit/5bf2959ab40f3e157b1dd4cf3e01b8248601a443))
* 548 - License "refactoring" ([#642](https://github.com/openfoodfacts/openfoodfacts-dart/issues/642)) ([18f5c6f](https://github.com/openfoodfacts/openfoodfacts-dart/commit/18f5c6f9b37b308ac8e0991c50fb57b738867007))
* 617 - new "save packagings V3" feature ([#640](https://github.com/openfoodfacts/openfoodfacts-dart/issues/640)) ([55ffbf2](https://github.com/openfoodfacts/openfoodfacts-dart/commit/55ffbf23f7e2ec757e8324d38da9fdaaeb8f7f1f))
* 648 - new method "Nutriments.isEmpty" ([#649](https://github.com/openfoodfacts/openfoodfacts-dart/issues/649)) ([d04e9eb](https://github.com/openfoodfacts/openfoodfacts-dart/commit/d04e9eb0be3cc34322ebb3e8d3dfd2c8cc6dfdb8))


### Bug Fixes

* 634 - mapped tag 'energy' to Nutrient energyKj. ([#644](https://github.com/openfoodfacts/openfoodfacts-dart/issues/644)) ([3957139](https://github.com/openfoodfacts/openfoodfacts-dart/commit/39571396d36385a16aa636a7b400c8ed69eb3dc7))

## [1.29.0](https://github.com/openfoodfacts/openfoodfacts-dart/compare/v1.28.0...v1.29.0) (2022-12-09)


### Features

* 618 - added 6 contribution fields ([#636](https://github.com/openfoodfacts/openfoodfacts-dart/issues/636)) ([fcfa446](https://github.com/openfoodfacts/openfoodfacts-dart/commit/fcfa4469d9c563c25d89596b72bfeca5a5c61f50))
* API V3 now supported for "get product" ([#633](https://github.com/openfoodfacts/openfoodfacts-dart/issues/633)) ([e118386](https://github.com/openfoodfacts/openfoodfacts-dart/commit/e118386dcce75cd877ed13873136c421dfe50b09))


### Bug Fixes

* 575 - less expected populated fields from Robotoff ([#639](https://github.com/openfoodfacts/openfoodfacts-dart/issues/639)) ([88edf86](https://github.com/openfoodfacts/openfoodfacts-dart/commit/88edf86683e804be38e67a2f62e37f94cc686412))
* Fix Badges ([#632](https://github.com/openfoodfacts/openfoodfacts-dart/issues/632)) ([27f1d87](https://github.com/openfoodfacts/openfoodfacts-dart/commit/27f1d87cb5d0bf3218df86d69334e7d96cc5d4ef))

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
