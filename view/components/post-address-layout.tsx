import DaumPostcodeEmbed, { Address } from 'react-daum-postcode';
const PostAddressLayout = () => {
    const handleComplete = (data: Address) => {
    
    let fullAddress = data.address;
    let extraAddress = '';

    if (data.addressType === 'R') {
      if (data.bname !== '') {
        extraAddress += data.bname;
      }
      if (data.buildingName !== '') {
        extraAddress += extraAddress !== '' ? `, ${data.buildingName}` : data.buildingName;
      }
      fullAddress += extraAddress !== '' ? ` (${extraAddress})` : '';
    }

    
  };

  return <DaumPostcodeEmbed onComplete={handleComplete} />;
};

export default PostAddressLayout;
