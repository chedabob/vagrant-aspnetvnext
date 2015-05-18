# vagrant-aspnetvnext

Vagrantfile and bootstrap script for setting up ASP.Net vNext

Just clone the repo then run 'vagrant up'

It'll take a while as there's a thousand Mono packages to install

Once it's up, put your server files in the working directory then ssh in

Then run 'dnu restore' from /vagrant to get all the NuGet packages, followed by 'dnx . kestrel' to start the kestrel server


Once it's loaded, it'll be available at localhost:8080 on the Host machine (or 5004 in the Vagrant guest)
