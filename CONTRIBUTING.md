## Contributing
So you want to contribute to the catalog? Great!
Here's a short guide on how you can get a local Sensu environment setup so you can develop/test/review new/proposed integrations 
not yet available in the main branch of the catalog

### Local Development/Testing Environment
1. local checkout of the sensu-go-workshop repository. In the following examples I'll refer to this directory as env var `$SENSU_GO_WORKSHOP`
2. local checkout of the catalog repository branch you want to develop/test. In the following examples I'll refer to this directory as env var `$SENSU_CATALOG`
3. local checkout of the catalog-api repository and the catalog-api binary. In the following examples I'll refer to this directory as env var `$SENSU_CATALOG_API`

### Requirements
* recent version of the Go lang compiler
* text editor that can edit yaml files

### Build catalog-api tool
In the local catalog-api repository directory build the catalog-api tool

```
$ cd $SENSU_CATALOG_API
$ go build  
```
### Run a local catalog server
```
$ cd $SENSU_CATALOG_API
$ ./catalog-api catalog server -repo-dir $SENSU_CATALOG
```
This should create a catalog http server on your local host on port 3003.  

### Update Workshop webconfig.yml 
edit `$SENSU_GO_WORKSHOP/config.sensu/cluster/webconfig.yaml` and 
update the catalog url to point to your locally hosted catalog, using an address the docker based workshop environment can access.

**Note:**  You **CANNOT** use `http://localhost:3003`  nor `http://127.0.0.1:3003` for this, because the workshop's backend container 
has its own concept of localhost. The correct host/ip-address you use will depend somewhat on your docker and network configuration. 
Try using the your local network address ex: '192.168.x.x'  



### Update workshop environment 

#### Option 1: Rebuild workshop environment
Easiest way to get the workshop to see updated configuration is to simply destroy the workshop environment and rebuild it from scratch
```
$ cd $SENSU_GO_WORKSHOP
$ docker-compose down -v
$ docker-compose up -d
```
#### Option 2: use sensuctl create
If you have sensuctl configured to authenticate with the workshop you can use `sensuctl create -f  sensu/cluster/webconfig.yaml`   



### Now you're ready to develop/test
After the workshop environment is reconfigured to look at your local catalog api server, you'll be able to develop/test new integrations 
not yet officially tagged and deployed to the public catalog api server.  
