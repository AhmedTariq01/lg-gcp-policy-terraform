class Gcp:

   def __init__(self, var_project_name,var_zone,var_instance):
      self.var_project_name=var_project_name
      self.var_zone= var_zone
      self.var_instance=var_instance
      

   def request (self):
      # Project ID for this request.
      project = self.var_project_name 
      # 'lofty-generator-312118'  # TODO: Update placeholder value.
      # The name of the zone for this request.
      zone = self.var_zone
      # 'us-central1-a'  # TODO: Update placeholder value.
      # Name of the instance resource to return.
      instance = self.var_instance
      # 'gcp-server'  # TODO: Update placeholder value.
      request = service.instances().get(project=var_project_name, zone=var_zone, instance=var_instance)
      return self.request.execute()
