import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_inspector_ai/core/constant/app_images.dart';

import 'models/onBoardingModel.dart';

class Static {
// static  String prompt ="""حلل هذه المادة! 📸
// أعطني صورة واضحة للمادة وأجب عن الأسئلة التالية:
// ما هذه المادة؟ (على سبيل المثال، كوب قهوة ورقي)
// من أين أتت؟ (على سبيل المثال، مقهى، متجر)
// ما هي وظيفتها؟ (على سبيل المثال، لحمل المشروبات الساخنة)
// سأقدم لك تحليلاً شاملاً يتضمن:
// مكوناتها ومواد صنعها
// كيفية تصنيعها وخصائصها
// تأثيرها على البيئة
// أفكار لإعادة استخدامها مع خطوات التنفيذ
// نصائح لتقليل استخدامها في الحياة اليومية
// معلومات حول إعادة تدويرها ومراكز إعادة التدوير
// قم بالرد على شكل json فقط وهذا مثال
// {
//   "Examination_Process": "يتكون هذا الكوب من الورق المقوى والبولي إيثيلين. تم تصنيعه من خلال عملية تتضمن قطع الورق المقوى وتشكيله ثم تغليفه بطبقة من البولي إيثيلين. له تأثير سلبي على البيئة لأنه مصنوع من مواد غير قابلة للتحلل بالكامل. يمكن إعادة استخدامه كحامل للنباتات أو وعاء للحرف اليدوية أو بيعه لمراكز إعادة التدوير. يمكن تقليل استخدامه باستخدام أكواب قابلة لإعادة الاستخدام أو شرب القهوة من المنزل.",
//   "Manufacturing_Process": "يتم تصنيع الورق المقوى من ألياف الأشجار، بينما يتم تصنيع البولي إيثيلين من النفط. تتطلب هذه العمليات كمية كبيرة من الطاقة والمواد الخام، مما يؤدي إلى انبعاثات غازات الاحتباس الحراري وتلوث الهواء والماء.",
//   "Environmental_Impact": "له تأثير سلبي على البيئة لأنه مصنوع من مواد غير قابلة للتحلل بالكامل. يمكن أن تتسبب النفايات الناتجة عن هذا الكوب في تلوث التربة والمياه. كما أن عملية تصنيعه تتطلب كمية كبيرة من الطاقة والمواد الخام، مما يؤدي إلى انبعاثات غازات الاحتباس الحراري وتلوث الهواء والماء.",
//   "Reuse_Suggestions": "يمكن إعادة استخدامه كحامل للنباتات أو وعاء للحرف اليدوية. يمكن أيضًا تزيينه واستخدامه كديكور.  يمكن بيعه لمراكز إعادة التدوير التي ستعيد استخدامه في تصنيع منتجات جديدة.",
//   "Reduce_Use": "يمكن تقليل استخدامه باستخدام أكواب قابلة لإعادة الاستخدام أو شرب القهوة من المنزل. يمكنك أيضًا شراء القهوة بالجملة وتقليل عدد الأكواب التي تستخدمها.",
//   "Information": "يمكن إعادة تدوير هذا الكوب في معظم مراكز إعادة التدوير. ابحث عن مركز إعادة تدوير محلي يقبل الورق المقوى والبلاستيك."
// }""" ;

  static  String prompt ="""
Analyze this material! 📸 Give me a clear picture of the material and answer the following questions: What is this material? (For example, a paper coffee cup) Where did it come from? (For example, a cafe, a store) What is its function? (For example, to carry hot drinks) I will provide you with a comprehensive analysis that includes: Its components and manufacturing materials How it's made and its properties Its impact on the environment Ideas for reusing it with implementation steps Tips to reduce its use in daily life Information about recycling it and recycling centers Please respond in json format only and here is an example {   “Examination_Process": “This cup is made of cardboard and polyethylene. It was manufactured through a process that includes cutting the cardboard, shaping it, then coating it with a layer of polyethylene. It has a negative impact on the environment because it is made of materials that are not fully biodegradable. It can be reused as a plant holder or a container for crafts, or sold to recycling centers. Its use can be reduced by using reusable cups or drinking coffee from home.",   “Manufacturing_Process": “Cardboard is made from tree fibers, while polyethylene is made from oil. These processes require a large amount of energy and raw materials, leading to greenhouse gas emissions and air and water pollution.",   “Environmental_Impact": “It has a negative impact on the environment because it is made of materials that are not fully biodegradable. The waste resulting from this cup can cause soil and water pollution. Also, its manufacturing process requires a large amount of energy and raw materials, leading to greenhouse gas emissions and air and water pollution.",   “Reuse_Suggestions": “It can be reused as a plant holder or a container for crafts. It can also be decorated and used as decor.  It can be sold to recycling centers that will reuse it in manufacturing new products.",   “Reduce_Use": “Its use can be reduced by using reusable cups or drinking coffee from home. You can also buy coffee in bulk and reduce the number of cups you use.",   “Information": “This cup can be recycled at most recycling centers. Look for a local recycling center that accepts cardboard and plastic." }""" ;
static String reponseOne = """{
  "Examination_Process": "تتكون البطاريات الموجودة في الصورة من أنواع مختلفة من المواد، بما في ذلك:\n\n* **المواد الفعالة:** هي المواد التي تنتج التيار الكهربائي عند تفاعلها مع بعضها البعض. تتكون المواد الفعالة في البطاريات الأولية من الزنك والمنغنيز أو الكربون. تتكون المواد الفعالة في البطاريات القابلة لإعادة الشحن من الليثيوم أو النيكل أو الكادميوم.\n* **الإلكتروليت:** هو سائل أو هلام يسمح بتدفق الأيونات بين المواد الفعالة. الإلكتروليت في البطاريات الأولية هو محلول كلوريد الأمونيوم أو هيدروكسيد البوتاسيوم. الإلكتروليت في البطاريات القابلة لإعادة الشحن هو حمض الكبريتيك أو محلول هيدروكسيد البوتاسيوم.\n* **الأقطاب الكهربائية:** هي الأجزاء المعدنية التي تتلامس مع الإلكتروليت. القطب الموجب هو القطب الذي يتدفق منه التيار الكهربائي. القطب السالب هو القطب الذي يتدفق إليه التيار الكهربائي.\n* **المفصلات:** هي الأجزاء التي تربط الأقطاب الكهربائية ببعضها البعض.\n* **العلبة:** هي الغلاف الذي يحتوي على جميع مكونات البطارية.\n\nتختلف خصائص البطاريات اعتمادًا على نوع المواد المستخدمة في تصنيعها. على سبيل المثال، تكون البطاريات الأولية خفيفة الوزن وقابلة للتخلص منها، بينما تكون البطاريات القابلة لإعادة الشحن أكثر ثباتًا ودائمًا.",
  "Manufacturing_Process": "يتم تصنيع البطاريات من خلال عملية متعددة الخطوات تتضمن ما يلي:\n\n1. **تصنيع المواد الفعالة:** يتم تصنيع المواد الفعالة من مواد خام، مثل الزنك والمنغنيز أو الكربون.\n2. **تصنيع الإلكتروليت:** يتم تصنيع الإلكتروليت من مواد خام، مثل كلوريد الأمونيوم أو هيدروكسيد البوتاسيوم أو حمض الكبريتيك.\n3. **تصنيع الأقطاب الكهربائية:** يتم تصنيع الأقطاب الكهربائية من معادن، مثل النحاس أو الألومنيوم.\n4. **تجميع البطارية:** يتم تجميع جميع مكونات البطارية، بما في ذلك المواد الفعالة والإلكتروليت والأقطاب الكهربائية والمفصلات والعلبة، في وحدة واحدة.\n5. **اختبار البطارية:** يتم اختبار البطارية للتأكد من أنها تعمل بشكل صحيح.",
  "Environmental_Impact": "يمكن أن يكون تصنيع البطاريات له تأثير سلبي على البيئة. تتضمن بعض التأثيرات البيئية لتصنيع البطاريات ما يلي:\n\n* **التلوث:** يتم إطلاق الملوثات، مثل ثاني أكسيد الكربون وأكاسيد النيتروجين، في الهواء أثناء عملية تصنيع البطاريات.\n* **استنزاف الموارد:** يتم استخراج المعادن المستخدمة في تصنيع البطاريات من الأرض، مما قد يؤدي إلى استنزاف الموارد الطبيعية.\n* **إزالة الغابات:** قد يتم استخدام الأشجار لإنتاج الفحم المستخدم في تشغيل أفران الصهر، مما قد يؤدي إلى إزالة الغابات.\n\nيمكن تقليل التأثير البيئي لتصنيع البطاريات من خلال إعادة تدوير البطاريات القديمة. يمكن استخدام البطاريات المعاد تدويرها لتصنيع بطاريات جديدة، مما يقلل من الحاجة إلى استخراج معادن جديدة.",
  "Reuse_Suggestions": "يمكن إعادة استخدام البطاريات القديمة بعدة طرق، بما في ذلك:\n\n* **استخدامها في الأجهزة ذات الاستهلاك المنخفض للطاقة:** يمكن استخدام البطاريات القديمة في الأجهزة ذات الاستهلاك المنخفض للطاقة، مثل الساعات والآلات الحاسبة.\n* **صنع الحرف اليدوية:** يمكن استخدام البطاريات القديمة لصنع الحرف اليدوية، مثل المجوهرات والديكورات المنزلية.\n* **إعادة تدويرها:** يمكن إعادة تدوير البطاريات وتحويلها إلى منتجات جديدة.\n\nيمكن العثور على معلومات حول إعادة تدوير البطاريات على مواقع الويب الخاصة بجمعيات إعادة التدوير المحلية.",
  "Information": "يمكن إعادة تدوير البطاريات في معظم مراكز إعادة التدوير. ابحث عن مركز إعادة تدوير محلي يقبل البطاريات."
}""" ;

static SharedPreferences? sharedPreferences ;

static List<OnBoardingModel> onBoardingList =[
  OnBoardingModel(title: "Exploring Waste with\n Artificial Intelligence", image: AppImages.one, body: " An Innovative Journey \n in the World of the Environment."),
  OnBoardingModel(title: "Be a Repository \n for Change", image: AppImages.two, body: "Discover Your Environmental Impact\n  through Our Application.."),
  OnBoardingModel(title: "Your Guide to \n  Environmental Transformation", image: AppImages.three, body: " Learn about the Harmful Effects of\n  Waste and How to Properly Dispose of It."),
];
}