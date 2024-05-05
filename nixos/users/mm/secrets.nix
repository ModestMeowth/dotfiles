{
  age.secrets = {
    tofu = {
      file = ../../../secrets/tofu.age;
      mode = "600";
      owner = "mm";
    };
    minio = {
      file = ../../../secrets/minio.age;
      mode = "600";
      owner = "mm";
    };
  };
}
