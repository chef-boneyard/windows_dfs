name             'windows_dfs'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache-2.0'
description      'A Chef resource for managing DFS on Windows hosts'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'
supports         'windows'
source_url       'https://github.com/chef-cookbooks/windows_dfs'
issues_url       'https://github.com/chef-cookbooks/windows_dfs/issues'
chef_version     '>= 13.0'

depends 'windows', '>=5.2'
