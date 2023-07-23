abstract class Either<L, R> {
  const Either();
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);
}
