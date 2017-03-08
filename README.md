Shell Provisioning for Vagrant
==============================

Why: Chef and puppet seems overkill and overwhelming for me

This is a collection of recipes for provisioning Vagrant Boxes.

You just plug your recipes on `provision.sh` file, and this config to provisioner in Vagrantfile :

```ruby
  require "erb"
  config.vm.provision :shell do |shell|
    relative = "./vagrant-shell-provisioner/"
    script = 'provision.sh'
	  shell.inline = ERB.new("<% def import(file); File.read('#{relative}' + file); end %>" + File.read("#{relative}#{script}")).result
  end
```

And voilá.


LICENSE
=========

Everything is licensed with MIT which is provided on the LICENSE file
