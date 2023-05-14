import React from 'react';
import {useOutletContext} from 'react-router-dom';
import {AdminReportOutletContext} from '@app/admin/reports/linkdz-admin-report-page';
import {VisitorsReportCharts} from '@common/admin/analytics/visitors-report-charts';
import {useAdminReport} from '@common/admin/analytics/use-admin-report';

export function AdminVisitorsReport() {
  const {dateRange} = useOutletContext<AdminReportOutletContext>();
  const {data, isLoading, isPreviousData} = useAdminReport({
    types: ['visitors'],
    dateRange: dateRange,
  });
  return (
    <VisitorsReportCharts
      isLoading={isLoading || isPreviousData}
      report={data?.visitorsReport}
    />
  );
}
