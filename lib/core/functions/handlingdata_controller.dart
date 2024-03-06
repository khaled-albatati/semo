import 'package:semo/core/class/statusrequiest.dart';

handlingData(response){
if(response is StatusRequiest){
return response;
}else{
  return StatusRequiest.success;
}
}