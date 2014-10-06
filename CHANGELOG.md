## Changelog

### 0.4.0
* Support version 2 of HipChat's API, as well as private HipChat server URLs.
  * hipchat gem version updated to 1.2.0
  * Version 1 API is still the default but expect this to change in a future release.
* test-kitchen suites now expect HIPCHAT_TEST_V1_TOKEN and HIPCHAT_TEST_V2_TOKEN environment variables

### 0.3.0
* Extend handler to allow configuration of name, color and notification
* Never actually published to the supermarket.

### 0.2.0
* Added test-kitchen. Export HIPCHAT_TEST_ROOM and HIPCHAT_TEST_TOKEN env vars when running test-kitchen
* Explicity installing httparty ~> 0.11.0 due to json gem conflicts introduced in newer versions

### 0.1.0
* Now using chef_gem resource to install hipchat gem, instead of gem_package resource.

### 0.0.4
* A git mishap necessitated the release of this version. No changes to code.

### 0.0.3
* notify now defaults to true, fixed using resource name as message body when no message is specified

### 0.0.2
* Adding support for specifying message color

### 0.0.1
* First public release

## Future

Consider using HTMLEntities or similar to encode messages before sending them.
