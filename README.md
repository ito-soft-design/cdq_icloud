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
I'm working on my github repository (branch icloud2).

[katsuyoshi/cdq - branch:icloud2](https://github.com/katsuyoshi/cdq/tree/icloud2)


- Create new App ID.  
    - e.g. com.itosoft.cdqicloud  
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

Install this app to more than two iOS devices. You can make sure the data is synced.


## How to configure icloud

You just write ```icloud: ture``` to cdq.yml file.

If you obviously specify the iCloud container, write ```icloud_container: CONTAINER_IDENTIFIER``` to cqd.yml file.



## Notification

### CDQ::CDQStoreManager::STORE_DID_INITIALIZE_NOTIFICATION

Posted after the managed object context for was initialized. If you don't use iCloud it is called.

### CDQ::CDQContextManager::DID_FINISH_IMPORT_NOTIFICATION

Posted when the data was synced via iCloud.


## Reference

- [iOS How-To : Using Core Data with iCloud](http://goddess-gate.com/dc2/index.php/post/452)
- [iCloud sync fails with “CoreData: Ubiquity: Invalid option: the value for NSPersistentStoreUbiquitousContentNameKey should not contain periods”](http://stackoverflow.com/questions/19209504/icloud-sync-fails-with-coredata-ubiquity-invalid-option-the-value-for-nspers)

