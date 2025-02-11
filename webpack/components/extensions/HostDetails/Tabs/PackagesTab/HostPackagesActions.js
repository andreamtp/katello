import { API_OPERATIONS, get, put } from 'foremanReact/redux/API';
import { errorToast, renderTaskStartedToast } from '../../../../../scenes/Tasks/helpers';
import { foremanApi } from '../../../../../services/api';
import {
  HOST_PACKAGES_INSTALL_KEY,
  HOST_PACKAGES_KEY,
  HOST_PACKAGES_REMOVE_KEY,
  HOST_PACKAGES_UPGRADE_KEY,
} from './HostPackagesConstants';

export const getInstalledPackagesWithLatest = (hostId, params) => get({
  type: API_OPERATIONS.GET,
  key: HOST_PACKAGES_KEY,
  url: foremanApi.getApiUrl(`/hosts/${hostId}/packages?include_latest_upgradable=true`),
  params,
});
export default getInstalledPackagesWithLatest;

export const installPackageViaKatelloAgent = (hostId, params) => put({
  type: API_OPERATIONS.PUT,
  key: HOST_PACKAGES_INSTALL_KEY,
  url: foremanApi.getApiUrl(`/hosts/${hostId}/packages/install`),
  handleSuccess: ({ data }) => renderTaskStartedToast(data),
  errorToast: error => errorToast(error),
  params,
});

export const removePackageViaKatelloAgent = (hostId, params) => put({
  type: API_OPERATIONS.PUT,
  key: HOST_PACKAGES_REMOVE_KEY,
  url: foremanApi.getApiUrl(`/hosts/${hostId}/packages/remove`),
  handleSuccess: ({ data }) => renderTaskStartedToast(data),
  errorToast: error => errorToast(error),
  params,
});

export const upgradePackageViaKatelloAgent = (hostId, params) => put({
  type: API_OPERATIONS.PUT,
  key: HOST_PACKAGES_UPGRADE_KEY,
  url: foremanApi.getApiUrl(`/hosts/${hostId}/packages/upgrade`),
  handleSuccess: ({ data }) => renderTaskStartedToast(data),
  errorToast: error => errorToast(error),
  params,
});

export const upgradeAllViaKatelloAgent = hostId => put({
  type: API_OPERATIONS.PUT,
  key: HOST_PACKAGES_UPGRADE_KEY,
  url: foremanApi.getApiUrl(`/hosts/${hostId}/packages/upgrade_all`),
  handleSuccess: ({ data }) => renderTaskStartedToast(data),
  errorToast: error => errorToast(error),
});
