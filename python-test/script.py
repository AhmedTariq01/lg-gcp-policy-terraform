import os
from pprint import pprint
from google.cloud import storage

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = r'python-auto-sa.json'
storage_client = storage.Client()
bucket_name = 'python_auto_bucket'
print(bucket_name)
# bucket = storage_client.bucket(bucket_name)
# bucket.storage_class = 'COLDLINE'
# bucket.location = 'US'
# bucket = storage_client.create_bucket(bucket)
# pprint(vars(bucket))
# bucket.name
# bucket._properties['selflink']
# bucket._properties['id']
# bucket._properties['location']
# bucket._properties['timeCreated']
# bucket._properties['storageClass']
# bucket._properties['timeCreated']
# bucket._properties['updated']
