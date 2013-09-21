$.reduce = function(array, initialValue, fnReduce){
  var workingValue = String(initialValue);
  $.each(array, function(arrayIndex, arrayValue) {
    workingValue = fnReduce.apply(arrayValue, [workingValue, arrayIndex, arrayValue]);
  });
  return workingValue;
}
