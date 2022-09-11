class ServiceBrand {
  ServiceBrand({
    this.title,
    this.selected,
  });

  final String title;
  bool selected = false;
}

final List<ServiceBrand> brands = [
  ServiceBrand(title: 'OPPO', selected: true),
  ServiceBrand(title: 'OnePlus'),
  ServiceBrand(title: '华为'),
  ServiceBrand(title: '荣耀'),
  ServiceBrand(title: '魅族'),
  ServiceBrand(title: '小米'),
  ServiceBrand(title: 'iPhone'),
  ServiceBrand(title: '十三香'),
  ServiceBrand(title: '第三方商品'),
];