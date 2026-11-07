// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final int typeId = 0;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      idMeal: fields[0] as String?,
      strMeal: fields[1] as String?,
      strMealAlternate: fields[2] as dynamic,
      strCategory: fields[3] as String?,
      strArea: fields[4] as String?,
      strCountry: fields[5] as String?,
      strInstructions: fields[6] as String?,
      strMealThumb: fields[7] as String?,
      strTags: fields[8] as String?,
      strYoutube: fields[9] as String?,
      strIngredient1: fields[10] as String?,
      strIngredient2: fields[11] as String?,
      strIngredient3: fields[12] as String?,
      strIngredient4: fields[13] as String?,
      strIngredient5: fields[14] as String?,
      strIngredient6: fields[15] as String?,
      strIngredient7: fields[16] as String?,
      strIngredient8: fields[17] as String?,
      strIngredient9: fields[18] as String?,
      strIngredient10: fields[19] as String?,
      strIngredient11: fields[20] as String?,
      strIngredient12: fields[21] as String?,
      strIngredient13: fields[22] as String?,
      strIngredient14: fields[23] as String?,
      strIngredient15: fields[24] as String?,
      strIngredient16: fields[25] as String?,
      strIngredient17: fields[26] as String?,
      strIngredient18: fields[27] as String?,
      strIngredient19: fields[28] as String?,
      strIngredient20: fields[29] as String?,
      strMeasure1: fields[30] as String?,
      strMeasure2: fields[31] as String?,
      strMeasure3: fields[32] as String?,
      strMeasure4: fields[33] as String?,
      strMeasure5: fields[34] as String?,
      strMeasure6: fields[35] as String?,
      strMeasure7: fields[36] as String?,
      strMeasure8: fields[37] as String?,
      strMeasure9: fields[38] as String?,
      strMeasure10: fields[39] as String?,
      strMeasure11: fields[40] as String?,
      strMeasure12: fields[41] as String?,
      strMeasure13: fields[42] as String?,
      strMeasure14: fields[43] as String?,
      strMeasure15: fields[44] as String?,
      strMeasure16: fields[45] as String?,
      strMeasure17: fields[46] as String?,
      strMeasure18: fields[47] as String?,
      strMeasure19: fields[48] as String?,
      strMeasure20: fields[49] as String?,
      strSource: fields[50] as String?,
      strImageSource: fields[51] as dynamic,
      strCreativeCommonsConfirmed: fields[52] as dynamic,
      dateModified: fields[53] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(54)
      ..writeByte(0)
      ..write(obj.idMeal)
      ..writeByte(1)
      ..write(obj.strMeal)
      ..writeByte(2)
      ..write(obj.strMealAlternate)
      ..writeByte(3)
      ..write(obj.strCategory)
      ..writeByte(4)
      ..write(obj.strArea)
      ..writeByte(5)
      ..write(obj.strCountry)
      ..writeByte(6)
      ..write(obj.strInstructions)
      ..writeByte(7)
      ..write(obj.strMealThumb)
      ..writeByte(8)
      ..write(obj.strTags)
      ..writeByte(9)
      ..write(obj.strYoutube)
      ..writeByte(10)
      ..write(obj.strIngredient1)
      ..writeByte(11)
      ..write(obj.strIngredient2)
      ..writeByte(12)
      ..write(obj.strIngredient3)
      ..writeByte(13)
      ..write(obj.strIngredient4)
      ..writeByte(14)
      ..write(obj.strIngredient5)
      ..writeByte(15)
      ..write(obj.strIngredient6)
      ..writeByte(16)
      ..write(obj.strIngredient7)
      ..writeByte(17)
      ..write(obj.strIngredient8)
      ..writeByte(18)
      ..write(obj.strIngredient9)
      ..writeByte(19)
      ..write(obj.strIngredient10)
      ..writeByte(20)
      ..write(obj.strIngredient11)
      ..writeByte(21)
      ..write(obj.strIngredient12)
      ..writeByte(22)
      ..write(obj.strIngredient13)
      ..writeByte(23)
      ..write(obj.strIngredient14)
      ..writeByte(24)
      ..write(obj.strIngredient15)
      ..writeByte(25)
      ..write(obj.strIngredient16)
      ..writeByte(26)
      ..write(obj.strIngredient17)
      ..writeByte(27)
      ..write(obj.strIngredient18)
      ..writeByte(28)
      ..write(obj.strIngredient19)
      ..writeByte(29)
      ..write(obj.strIngredient20)
      ..writeByte(30)
      ..write(obj.strMeasure1)
      ..writeByte(31)
      ..write(obj.strMeasure2)
      ..writeByte(32)
      ..write(obj.strMeasure3)
      ..writeByte(33)
      ..write(obj.strMeasure4)
      ..writeByte(34)
      ..write(obj.strMeasure5)
      ..writeByte(35)
      ..write(obj.strMeasure6)
      ..writeByte(36)
      ..write(obj.strMeasure7)
      ..writeByte(37)
      ..write(obj.strMeasure8)
      ..writeByte(38)
      ..write(obj.strMeasure9)
      ..writeByte(39)
      ..write(obj.strMeasure10)
      ..writeByte(40)
      ..write(obj.strMeasure11)
      ..writeByte(41)
      ..write(obj.strMeasure12)
      ..writeByte(42)
      ..write(obj.strMeasure13)
      ..writeByte(43)
      ..write(obj.strMeasure14)
      ..writeByte(44)
      ..write(obj.strMeasure15)
      ..writeByte(45)
      ..write(obj.strMeasure16)
      ..writeByte(46)
      ..write(obj.strMeasure17)
      ..writeByte(47)
      ..write(obj.strMeasure18)
      ..writeByte(48)
      ..write(obj.strMeasure19)
      ..writeByte(49)
      ..write(obj.strMeasure20)
      ..writeByte(50)
      ..write(obj.strSource)
      ..writeByte(51)
      ..write(obj.strImageSource)
      ..writeByte(52)
      ..write(obj.strCreativeCommonsConfirmed)
      ..writeByte(53)
      ..write(obj.dateModified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
