![Ravenland](https://ravenland.org/img/ravenland_text_logo.c117b9bb.png)

## Ravencoin Asset Distribution Script

This simple script is capable of distributing a Ravencoin Asset Token to addresses in bulk. 

It is the first public revision of an air drop application used for the RAVENLAND Alpha test security token distribution on 1st January 2019 which saw the WWW.RAVENLAND.ORG asset distributed to nearly 1 million addresses. The way the script works is that it reads the Ravencoin addresses within the provided file sample-addresses.txt. It traverses the address list line by line, making an raven-cli RPC call to transfer the assets one by one. This is a simplified community version of the same script used by Ravenland, it has limited validation functions and logging, however has some basic protection for mem pool overloading, and RPC connection breaks. Just ensure that you run the application using screen or run the application piping the output to get a full log. Examples given below.

This project has been shared freely this for the enjoyment of the Ravencoin community and our Ravenland Ravencoin partner network. Thanks to all that have supported us in our beta testing. KAWWW!

![Ravenland](https://gateway.ravenland.org/ipfs/QmdbBwGgH8fNDvpiatfkmq72Np1zQcz5icY4yoDEuo5n4q)



# Install + Setup 

```bash
# Clone Repository
git clone https://github.com/ravenlandpush/RavencoinAssetDistributor
cd RavencoinAssetDistributor

# Edit the script "ASSET=" and "AMOUNT=" variables for your use
nano dist.sh

# Running the script
chmod +x dist.sh
./dist.sh

# Running the script and basic logging of transactions (that can be parsed / validated later)
./dist.sh > distribution.log

# To view process if using distribution.log use
tail -f distribution.log
```

For more expert users who already are familiar with and have correctly setup their RPC and raven-cli environment. You should only need the above. And to set the ASSET="" AMOUNT="" variables in the dist.sh script file.

For beginners or those inexperienced with working with ravend and RPC please read on carefully the important notes below.

# Configuring RPC Environment and RPC User/Passwords

To use the Ravenland Ravencoin Asset Distributor, you must either run the script as t**he same user that ravend runs as**. 



### Configuring as a separate user

 Alternatively, if you desire to run as a separate user you can do so **only** by placing the .raven folder provided in this repository in the user environment root you wish to run as. 

This is an important consideration since raven-cli obtains the RPC username and password to connect to the ravend socket RPC socket in the users home ~/.raven/raven.conf file. If you don't set it the RPC connection will not work. 

Eg. if ravend runs as 'raven' and you want to run the script as user 'someuser', you would need to run;

```bash
# Copy the RPC configuration we provide for you
cp -rp RavencoinAssetDistributor/.raven /home/someuser
```

**PLEASE NOTE RAVEND MUST BE RESTARTED BY THE USER FOR CHANGES TO TAKE EFFECT**

```
# Change the section /yourpassword/ to the desired secure password (script works without this step but added for security information purposes)
sed -i 's/securepasswordgoeshere/yourpassword/g' /home/someuser/.raven/raven.conf
```

*The above 'sed' line is used to change the RPC password. Although the software works without the extra step it is recommended* that you do it to ensure your RPC cannot be used by a hostile party. 



# LICENSE & TERMS OF USE

> The MIT License
>
> Copyright © 2017-2019 ADAM BULL & RAVENLAND.ORG
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
>Neither the name of Django nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

