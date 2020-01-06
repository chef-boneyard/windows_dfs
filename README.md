# windows_dfs Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/windows_dfs.svg)](https://supermarket.chef.io/cookbooks/windows_dfs)
[![Build status](https://ci.appveyor.com/api/projects/status/ojhleem9td663n39/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks/windows-dfs/branch/master)

This cookbook provides a resource for managing DFS on Windows hosts.

## Requirements

### Platforms

- Windows Server 2012R2
- Windows Server 2016

### Chef

- Chef 13.4+

## Resources

## windows_dfs_server
Sets the server configuration for dfs

 ### Actions

- `configure` : Configures dfs with the specified settings

### Properties

- `use_fqdn` : Indicates whether a DFS namespace server uses FQDNs in referrals. If this parameter has a value of true, the server uses FQDNs in referrals. If this parameter has a value of false, the server uses NetBIOS names. Defaults to false

## windows_dfs_folder

Creates a folder within dfs as many levels deep as required

 ### Actions

- `:install` : Creates the folder in dfs namespace
- `:remove` : Deletes the folder in the dfs namespace

 ### Properties

- `folder_path` : This is the path of the folder to create
- `namespace_name` : The namespace this should be created within
- `target_path` : The target that this path will connect you to
- `description` : Description for the share

### Example

```ruby
windows_dfs_folder "Some\\Nested\\Path" do
      description "Link to MyServer share MyShare"
      namespace_name 'prodshare'
      target_path "\\\\server\\target_share\\Some\\Nested\\Path"
      action :install
end
```

```ruby
windows_dfs_folder "Some\\Nested\\Path" do
      namespace_name 'prodshare'
      action :remove
end
```

## windows_dfs_namespace

Creates a dfs namespace on the local server, permissions are set the same as a windows share.

 ### Actions

- `:install` : Creates the dfs namespace on the server

 ### Properties

- `namespace_name` : The name of the namespace to create
- `description` : Friendly description for windows to show
- `root` : The root from which to create the DFS tree, defaults to C:\DFSRoots
- `full_users` : Which users should have full access to the share
- `change_users` : Which users should have change access to the share
- `read_users` : Which users should have read access to the share

```ruby
windows_dfs_namespace 'prodshare' do
  description 'Used to easily access shares on other servers'
  action :install
  full_users 'localhost\\users'
```

## License
```
Copyright 2018, Calastone Ltd.
Copyright 2018, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
