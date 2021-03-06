# Changelog

##### 0.3.0 [2016-01-14]
* Carthage support

##### 0.2.0 [2015-10-24]
* Changed timesRepeat indexing (was 1-based, now is 0-based)

##### 0.1.7 [2015-10-08]
* Added support for `NSMapTable`
* Added support for `NSHashTable`
* Added support for `NSPointerArray`

##### 0.1.6 [2015-09-09]
* Added `at:` / `at:ifAbsent:` / `at:ifPresent:`
* Added `at:put:` / `at:ifAbsentPut:`

##### 0.1.5 [2015-08-20]
* Added `takeWhile:` / `dropWhile:`

##### 0.1.4 [2015-08-11]
* Added `groupedBy:`

##### 0.1.3 [2015-08-09]
* Added aggregation extensions (`average`, `max`, `min`, `sum`)
* Added `OCInterval` and according `NSNumber` extensions (`to:`, `to:by:`)
* Added `NSDictionary` extensions (`includesKey:`, `includesValue:`, `add:`)
* Added `collect:` alias for `map:`
* Added missing documentation for `NSObject` extensions

##### 0.1.2 [2015-08-07]
* Fixed issue with error handling macros
* Added `NSNumber` extensions (`atRandom`, `timesRepeat:`, `timesRepeatWithIndex:`)
* Added `count:` extension

##### 0.1.1 [2015-08-06]
* Updated README
* Added error handling macros

##### 0.1.0 [2015-08-06]
* Initial release
