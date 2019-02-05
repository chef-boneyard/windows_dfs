directory 'C:\\Test\\Child' do
  recursive true
end

windows_share 'Test' do
  path 'C:\\Test'
end

windows_feature %w(FS-DFS-Namespace
                   RSAT-DFS-Mgmt-Con
                   RSAT-File-Services) do
  install_method :windows_feature_powershell
end

windows_dfs_server 'localhost' do
  action    :configure
  use_fqdn  false
end

windows_dfs_namespace 'prodshare' do
  description 'My Description'
  action      :install
  full_users  ['BUILTIN\\Users']
end

windows_dfs_folder 'Data\\chef\\target' do
  description     'My Description'
  namespace_name  'prodshare'
  target_path     '\\\\localhost\\Test'
  action          :install
end
