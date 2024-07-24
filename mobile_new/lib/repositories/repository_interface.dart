part of repositories;

sealed class RepositoryInterface<T extends ChopperService> {
  T get service => apiService.getService<T>();
}
