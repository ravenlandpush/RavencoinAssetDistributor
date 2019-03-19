![Ravenland](https://ravenland.org/img/ravenland_text_logo.c117b9bb.png)

## Ravencoin Asset Distribution Script

This simple script is capable of distributing a Ravencoin Asset Token to addresses in bulk. 

It is the first public revision of an air drop application used for the RAVENLAND Alpha test security token distribution on 1st January 2019 which saw the WWW.RAVENLAND.ORG asset distributed to nearly 1 million addresses. 

This project has been shared freely this for the enjoyment of the Ravencoin community and our Ravenland Ravencoin partner network. Thanks to all that have supported us in our beta testing. KAWWW!

![Ravenland](https://gateway.ravenland.org/ipfs/QmdbBwGgH8fNDvpiatfkmq72Np1zQcz5icY4yoDEuo5n4q)



# Install + Setup 

```bash
# Clone Repository
git clone https://github.com/ravenlandpush/RavencoinAssetDistributor
cd RavencoinAssetDistributor

# Edit the script "ASSET=" and "AMOUNT=" variables for your use
nano dist.sh
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
