
abstract class Parameter {

  String getName();

  String getValue();

  String toString() {
    return "&" + getName() + "=" + getValue();
  }

  const Parameter();
}