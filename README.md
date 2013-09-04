Shell Provisioning for Vagrant
==============================

Why: Chef and puppet seems overkill and overwhelming for me

This is a collection of recipes for provisioning Vagrant Boxes.

You just plug your recipes on `provision.sh` file, put: `require 'irb'` on the top of Vagrantfile, and this config to provisioner in Vagrantfile too:

```ruby
config.vm.provision :shell do |shell|

  relative = "./shell-provision"
  script = 'provision.sh'
  shell.inline = ERB.new("<% def import(file); File.read('#{relative}' + file); end %>" + File.read("#{relative}#{script}")).result
end
```

And voilá.


COPYRIGHT
=========

I really don't know how to deal with licenses:

[@StanAngeloff](https://github.com/StanAngeloff/vagrant-shell-scripts), the ubuntu distro script is from his repo. Which is licensed with MIT.

My contributions and code, is licensed with: [![WTFPL](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png)](http://www.wtfpl.net/) because, you know, it's the best license out there. See License file.
