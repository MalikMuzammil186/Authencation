mixin AuthBehavior{
  String checkException({required String erorrCodde}){
    String msg="Some Thing went wrong:";
    switch (erorrCodde) {
      case  'Weak_Password':
      msg="Try Strong Password" ;
    break;
    case 'e_mail already in use':
    msg="Try another E_mail";
    break;
    case 'No Email Exist':
    msg="No Email exist ";
    break;
    
      default:
      msg="Try an other some thing";
    }
    return msg;

  }
  
}