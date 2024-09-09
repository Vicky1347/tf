// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_database/firebase_database.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:place/core/di/firebase_module.dart' as _i11;
import 'package:place/data/repositories/firebase_auth_repository.dart' as _i6;
import 'package:place/data/repositories/firebase_pixels_repository.dart' as _i9;
import 'package:place/domain/repositories/auth_repository.dart' as _i5;
import 'package:place/domain/repositories/pixels_repository.dart' as _i8;
import 'package:place/presentation/blocs/auth/auth_cubit.dart' as _i7;
import 'package:place/presentation/blocs/pixels/pixels_bloc.dart' as _i10;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i3.FirebaseAuth>(() => firebaseModule.provideFirebaseAuth());
    await gh.singletonAsync<_i4.FirebaseDatabase>(
      () => firebaseModule.provideFirebaseProdDatabase(),
      registerFor: {_prod},
      preResolve: true,
    );
    gh.factory<_i5.AuthRepository>(
        () => _i6.FirebaseAuthRepository(gh<_i3.FirebaseAuth>()));
    gh.factory<_i7.AuthCubit>(() => _i7.AuthCubit(gh<_i5.AuthRepository>()));
    gh.factory<_i8.PixelsRepository>(
        () => _i9.FirebasePixelsRepository(gh<_i4.FirebaseDatabase>()));
    gh.factory<_i10.PixelsBloc>(() => _i10.PixelsBloc(
          gh<_i8.PixelsRepository>(),
          gh<_i5.AuthRepository>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i11.FirebaseModule {}
