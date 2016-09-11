var ns= function(name, register){
  var namespace = function (nstring) {
    var root = window;
    var names = nstring.split('.');
    for (var i in names) {
      if (names.hasOwnProperty(i)) {
        root[names[i]] = root[names[i]] || {};
        root = root[names[i]];
      }
    }
    return root;
  };

  register(namespace(name));
};