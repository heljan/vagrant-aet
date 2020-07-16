
# Custom variables 
# ------------------------------------------------------
vm_hostname = "alpine-sandbox.local"
vagrant_plugins = %w(vagrant-hostmanager)
ip_address = "192.168.59.12"
box_version = "generic/alpine38"
custom_files = %w(
  custom/aet/aet.sh
  custom/aet/suite.xml
  custom/scripts/configure_aet.sh
)

virtual_box_cpu = 2
virtual_box_mem = 4096
# ------------------------------------------------------

# Main Configuration:

Vagrant.configure("2") do |config|

  # Install required plugins
  vagrant_plugins.each do |plugin|
    system "vagrant plugin install #{plugin}" \
    unless Vagrant.has_plugin? plugin
  end

  # VM hostname setup
  config.vm.hostname = vm_hostname

  # Define Box Image
  config.vm.box = box_version

  # Set private IP interface
  config.vm.network "private_network", ip: ip_address

  # Configure proper hosts entries
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  # Set parameters for Virtual Box Machine:
  config.vm.provider "virtualbox" do |vb|
    vb.name = vm_hostname
    vb.linked_clone = true
    vb.memory = virtual_box_mem
    vb.cpus = virtual_box_cpu
  end 

  # Upload custom files
  custom_files.each do |f|
    config.vm.provision "file" , \
      source: f, \
      destination: "/var/tmp/" + f
  end

end
