class SliderModel{
  String text;
  String image;
  String title;
  String description;


// Constructor for variables
  SliderModel({required this.text, required this.title, required this.description, required this.image});

  void setText(String getText){
    description = getText;
  }

  void setImage(String getImage){
    image = getImage;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDescription(String getDescription){
    description = getDescription;
  }


  String getText(){
    return text;
  }

  String getImage(){
    return image;
  }

  String getTitle(){
    return title;
  }
  String getDescription(){
    return description;
  }
}

// List created
List<SliderModel> getSlides(){
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel(text: '', title: '', description: '', image: '');

// Item 1
  sliderModel.setText("skip");
  sliderModel.setImage("assets/onboarding/img_1.png");
  sliderModel.setTitle("E Shopping ");
  sliderModel.setDescription("Explore top organic fruits & grab them");
  slides.add(sliderModel);

  sliderModel = SliderModel(text: '', title: '', description: '', image: '');

// Item 2
  //sliderModel.setText("skip");
  sliderModel.setImage("assets/onboarding/img_2.png");
  sliderModel.setTitle("Delivery on the way");
  sliderModel.setDescription("Get your order by speed delivery");
  slides.add(sliderModel);

  sliderModel = SliderModel(text: '', title: '', description: '', image: '');

// Item 3
  sliderModel.setImage("assets/onboarding/img_3.png");
  sliderModel.setTitle("Delivery Arrived");
  sliderModel.setDescription("Order is arrived at your place");
  slides.add(sliderModel);

  sliderModel = SliderModel(text: '', title: '', description: '', image: '');
  return slides;
}

