class Response<T> {
  final bool isCancel;
  final bool isSuccessful;
  final bool isFailed;
  final String message;
  final T? result;
  final dynamic snapshot;
  final dynamic error;
  final Status status;

  const Response({
    this.result,
    this.message = '',
    this.isCancel = false,
    this.isSuccessful = false,
    this.isFailed = false,
    this.snapshot,
    this.error,
    this.status = Status.noContent,
  });

  Response<T> copyWith({
    bool? isCancel,
    bool? isSuccessful,
    bool? isFailed,
    T? result,
    String? message,
    dynamic snapshot,
    dynamic error,
    Status? status,
  }) {
    return Response<T>(
      isCancel: isCancel ?? this.isCancel,
      isSuccessful: isSuccessful ?? result != null ? true : this.isSuccessful,
      isFailed: isFailed ?? this.isFailed,
      result: result ?? this.result,
      snapshot: snapshot ?? this.snapshot,
      error: error ?? this.error,
      message:
          message ?? (isSuccessful ?? false ? "Successful!" : this.message),
      status: status ??
          (result != null
              ? Status.ok
              : (snapshot != null
                  ? Status.created
                  : (message != null ? Status.notFound : this.status))),
    );
  }

  Error? getError<Error>() {
    return error != null && error is Error ? error : null;
  }

  Snapshot? getSnapshot<Snapshot>() {
    return snapshot != null && snapshot is Snapshot ? snapshot : null;
  }

  get statusCode => status.value;
}

enum Status {
  processing(200),
  ok(200),
  created(201),
  accepted(202),
  noContent(204),
  resetContent(205),
  partialContent(206),
  multipleChoices(300),
  movedPermanently(301),
  notFound(404),
  notAcceptable(406),
  requestTimeout(408);

  const Status(this.value);

  final int value;
}
