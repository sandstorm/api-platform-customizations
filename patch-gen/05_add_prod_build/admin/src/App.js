import React from 'react';
import { HydraAdmin } from '@api-platform/admin';

// NOTE: the "/api" endpoint is not allowed to end with a slash for proper functioning
export default () => <HydraAdmin entrypoint={process.env.REACT_APP_API_ENTRYPOINT || window.location.origin + '/api'}/>;
