## CDQ iCloud

This is a test project of cdq which working with iCloud.


## Requirement

### Environment

- Xcode
- RubyMotion

### Gems

- [CDQ](https://github.com/infinitered/cdq)

## How to run it

You need configure App ID, iCloud container and provisioning file at iOS Developer Program site.  
I'm working on my github reposition, branch icloud.

[katsuyoshi/cdq](https://github.com/katsuyoshi/cdq)


- Create new App ID.
  e.g. com.itosoft.cdqicloud
- Create iCloud container.
    - e.g. com.itosoft.cdqicloud
- Configure App ID which works with iCloud container.
    - e.g. iCloud.com.itosoft.cdqicloud
- Create a provisioning profile for development.
- Replace app.identifier, app.codesign_certificate, app.provisioning_profile　 in Rakefile
- Run below scripts

```sh
$ bundle
$ rake device
```

You install this app to more than 2 iOS devices. You can make sure the data is synced.


## How to configure icloud

You just write ```icloud: ture``` to cdq.yml file.

If you obviously specify the iCloud container, write ```icloud_container: CONTAINER_IDENTIFIER``` to cqd.yml file.



## Notification

### CDQ::CDQStoreManager::STORE_DID_INITIALIZE_NOTIFICATION

Posted after the managed object context for was initialized. If you don't use iCloud it is called.

### CDQ::CDQContextManager::DID_FINISH_IMPORT

Posted when the data was synced via iCloud.


