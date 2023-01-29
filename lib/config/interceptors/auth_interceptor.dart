import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  static const authorizationKey = "Authorization";

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(
      options
        ..headers.addAll(
          {
            authorizationKey:
                'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjhERjU1MDUxRjc2NENEM0MzNDc0MzI2Mjk0Qjg0MDJBMzIwMDBBOUMiLCJ4NXQiOiJqZlZRVWZka3pUdzBkREppbExoQUtqSUFDcHciLCJ0eXAiOiJhdCtqd3QifQ.eyJzdWIiOiI3Yjk2NjE5Ny1jZDRmLTQ4ZDktYmQwMC1hMTc1M2MxZmE4OWIiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiN2I5NjYxOTctY2Q0Zi00OGQ5LWJkMDAtYTE3NTNjMWZhODliIiwib2lfcHJzdCI6InN3YWdnZXIiLCJvaV9hdV9pZCI6ImJlYmE0YjdkLWNmNGYtNDllNC04MzVlLTE1NTJhNzhhNzg0NSIsImNsaWVudF9pZCI6InN3YWdnZXIiLCJvaV90a25faWQiOiI2N2ZkOWU2Yy03ZTY5LTQzMWQtOWVlNC0yMzIwZGMwODU4ODAiLCJzY29wZSI6ImFwaSIsImV4cCI6MTcwNDU2MzQ1MiwiaXNzIjoiaHR0cDovLzE0Ni41OS4xMjYuMTkzLyIsImlhdCI6MTY3MzQ1OTQ1Mn0.cLjn3U83xQoDSFxnjmtOjIY5wuZO2XiDAclYxz1nlMaIavSxA_-7x5Ri-jq0DiftzAHDE5QTx6v6Xp71XelVKu0wnG3t0tHYELS850PSBtVFkkD_ZjoEkpEOWRRizVU4Mr_u6cVujP7wodK_v99p3FVRjOgGR7gYsTlG9rFs_JK3fNRa9IVUvFKu-4To1HZYi62YmRGPxMjDS0T2aoFzPGnuMgsBsnhFZdP5KVUoH3fDYcPUOOQwYNJSWeQKW_sk9bIOAR2HfXVdGLI5RTc11iyBzthCUmEJHYgr6qS8pihYdv-fWnwKEzkx3xMSpIBumTug7VjPCtZVkOI9raWXbw',
          },
        ),
    );
  }
}
