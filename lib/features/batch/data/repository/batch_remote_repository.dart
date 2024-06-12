import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/batch/data/data_source/batch_remote_datasource.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_starter/features/batch/domain/repository/batch_repository.dart';

final batchRemoteRepoProvider = Provider<IBatchRepository>(
  (ref) => BatchRemoteRepoImpl(
    batchRemodeDataSource: ref.read(batchRemoteDataSourceProvider),
  ),
);

class BatchRemoteRepoImpl implements IBatchRepository {
  final BatchRemoteDataSource batchRemodeDataSource;

  BatchRemoteRepoImpl({required this.batchRemodeDataSource});

  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    return batchRemodeDataSource.addBatch(batch);
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRemodeDataSource.getAllBatches();
  }
}
