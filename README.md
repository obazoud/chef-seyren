# seyren-cookbook

This cookbook is designed to be able to deploy [Seyren](https://github.com/scobal/seyren) application.

[![Build Status](https://travis-ci.org/obazoud/chef-seyren.png)](https://travis-ci.org/obazoud/chef-seyren)

## Supported Platforms

Ubuntu, CentOS

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['seyren']['application_name']</tt></td>
    <td>String</td>
    <td>Name of the application</td>
    <td><tt>seyren</tt></td>
  </tr>
  <tr>
    <td><tt>['seyren']['application_path']</tt></td>
    <td>String</td>
    <td>Location to deploy Seyren</td>
    <td><tt>/opt/seyren</tt></td>
  </tr>
  <tr>
    <td><tt>['seyren']['application_version']</tt></td>
    <td>String</td>
    <td>Version to deploy</td>
    <td></td>
  </tr>
  <tr>
    <td><tt>['seyren']['war_uri']</tt></td>
    <td>String</td>
    <td>URI where the Seyren war is</td>
    <td></td>
  </tr>
</table>

## Usage

### seyren::default

Include `seyren` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[seyren::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Olivier Bazoud (<olivier.bazoud@gmail.com>)

Copyright:: 2014, Olivier Bazoud

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
