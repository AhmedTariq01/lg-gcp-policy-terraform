"""
BEFORE RUNNING:
---------------
1. If not already done, enable the Compute Engine API
   and check the quota for your project at
   https://console.developers.google.com/apis/api/compute
2. This sample uses Application Default Credentials for authentication.
   If not already done, install the gcloud CLI from
   https://cloud.google.com/sdk and run
   `gcloud beta auth application-default login`.
   For more information, see
   https://developers.google.com/identity/protocols/application-default-credentials
3. Install the Python client library for Google APIs by running
   `pip install --upgrade google-api-python-client`
"""
import requests
import os
import sys
from pprint import pprint
from googleapiclient import discovery
from oauth2client.service_account import ServiceAccountCredentials
from gcpclass import Gcp
import json


scopes = ['https://www.googleapis.com/auth/compute']
credentials = ServiceAccountCredentials.from_json_keyfile_name(
    'python-auto-sa.json', scopes)
# credentials =  'Credentials/terraformkey1.json'
service = discovery.build('compute', 'v1', credentials=credentials)

var_project_name = sys.argv[1]
var_zone = sys.argv[2]
var_instance = sys.argv[3]

obj = Gcp()
response = obj.request(var_project_name,var_zone,var_instance)
# TODO: Change code below to process the `response` dict:
pprint(response['name'])