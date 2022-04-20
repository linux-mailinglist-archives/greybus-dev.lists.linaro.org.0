Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6E850811E
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 08:25:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 76B744047A
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 06:25:45 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lists.linaro.org (Postfix) with ESMTPS id 93D123EEFF
	for <greybus-dev@lists.linaro.org>; Wed, 20 Apr 2022 06:25:42 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23K41wIa009605;
	Wed, 20 Apr 2022 06:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=w9inuPrG/pp8KqUmaJulfCt0qfta2sil0oq+WD3fJTQ=;
 b=bjTpknsdCzxwkwYpFalBePBNOgh+a+1/XqhqDuv/8tz8XYyxr0+1xM0UtS1V2H1SQatD
 topIEqfGhRLrqzz1xXxWBH4v4GZYy/PySjcJYmskn7eF6+OoNkuMmpcq+d8dEE0Jqa58
 60QWPyPpmRgGgMenhJvPMAUxKnmz2AFS8wVpyLJd2u7CrXLaKgcXfGdxGLEgarC15Myn
 u4SRdxe5lIs5cxoJtzmpu+Ch7uOnlCtbyy90psV4CHcBENctQEIJedMj3eINLb6NDo2A
 LTMM+k+FzSJygkmMRvhRlUYy8N2plL91idHeQS03EE+q/J85vFrkR3+hpF6eUccOK3+9 cw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com with ESMTP id 3ffmk2r1wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Apr 2022 06:25:32 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23K6GiVQ034728;
	Wed, 20 Apr 2022 06:25:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3ffm8988kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Apr 2022 06:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlUXaOcHewtDbNNyVijH18UkRXWbpm/KLzj5G+1QFf/GjAbwaOdrYiI8zHthbp8SmnQjmaVVmL50/QKJbMIHLUhqrZv1O9PfL/wr5GaSsRfY1qHoxpEztcTQsOJ1mFBI6wEE2YG7dhVDQy19rt4BSFhDzR9xcceL8gkpYMwEo/BxUhAvEmu39pZrJ3Xui+xjUu9OFz0/AzeR2OV1DaBFEM4mPVYMmsFeEq5LhhUVkAfsOd2izeMxNWdhrsGjpE0v6OMmHy5fjWSClrMmjS78J1AzxW3DkB3byDj1t867XZxcIvwbZvZtuvg9T7bpzxdscNy44w/VgigPMjpVPoh8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9inuPrG/pp8KqUmaJulfCt0qfta2sil0oq+WD3fJTQ=;
 b=fZVojByvP/2raQbSLJMS/BCeb+7ik31pFwFA8VHSXRLNodCY2JXrDAw1z/vhPFBvPSC6xdrKV2dxPHdOfplGPWb1YxgVhJf3mp7aZ41XW+ntzntiA+90o94Y8TQ/tpD2DMAsGKgcbveeJSgpNMBJ9EadbgBx2F1aozd5ivCH9JjkAhK+1jeo9XVPja4DrtFA09z6BIyPQIFaTvFA2NlYfSU8LfPoinmx80Py1I6jqQhrMSM1N5fXj64i4b7c1fgBwBB9RJozwAbZOxb5apBy8JNihRf1TJuNV+mrrU9+dP3pd3sfuLD+ZNARgGaRQeIuoXvo8bs2NGkMjLS2bXq6Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9inuPrG/pp8KqUmaJulfCt0qfta2sil0oq+WD3fJTQ=;
 b=sasixq1UKLAeBM/n1fsGaj9bHJbJItJROsjHemOS3jzLY0xa7hRUHuJBINhBkuHZX/Q9AWlDyrvtbFPZ6BO1mzG0jgzcIJZyKnRuH6hOOAr+AAU7oeN7ViG2gmPi+pn3AY/PQf3AJx/xh7tsCbdFrQt2k4RdCL5BpzLsdHZ2J1s=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5122.namprd10.prod.outlook.com
 (2603:10b6:208:328::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 06:25:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 06:25:29 +0000
Date: Wed, 20 Apr 2022 09:24:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ian Cowan <ian@linux.cowan.aero>
Message-ID: <20220420062446.GA2951@kadam>
References: <20220420053755.48934-1-ian@linux.cowan.aero>
Content-Disposition: inline
In-Reply-To: <20220420053755.48934-1-ian@linux.cowan.aero>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0043.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::19)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8e1343f-c0e1-48f4-4875-08da22969050
X-MS-TrafficTypeDiagnostic: BLAPR10MB5122:EE_
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB5122B6E33185A6C539EC182D8EF59@BLAPR10MB5122.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1wZinv5p8soQrNWRUZEOQTH6pTouNfkkiy6mJwmyT17GYPtuP0J7/LItQ6r9RFSKyxgLOsO3qJmeFNWbgD4te+Mewk6PLuVy3Jk2LlptRtBmQfVs23YL3VAM2ATqkutafHgYkkl0TRxslwtMl+5AtcNSSbC2SMFlbRtPYeR9YkURmL6a0rBT89q8Jvg+DdpE1OzPNKWllgiE4PRA1pajbe/4ztgyeCCvSvrPTFyrXFbu/TiKrlZzQ5LNtb7BHES3g/A43xW/ncuyj0gb52CJVD9/KeyeXEdmsWJCWvbNtxZeAol2np2aacNY3GIde1Gp89pNLKYE3SXkTohzYVjPRuCELk4FkM8cSK2jPpjVxFjSZ72pxzvRLJwSNe1BuLA9I8i4erpseD3OHAO1qua9mpyzxbkJcmGq10YKD93y1HcJ9FYngfRHkEiflKhofSPVS+rzMRFl+9Bkhe6Q33nf/umForoYycqt1/9+V5lSVR+Erq9CltvcyuRLORPPXXPjIll/PqpAp4ML8CBh1xYK8SHYz188ygMenRWFsGtT+EvLR5nLBRBBR/ajsP5sjsrpO33Oz9n7BE+o1h67ZHyRiPt3cheUVvqxrs+OpjqD/vYqrKxM0p1fIKTzC/VrN2pdHCdND9DGmoFgvw/5PwJn97pt4zXrPOAn9YGRGQu9JU3gq4T3c3Wt2rvZ7dwXMVCdSvTMWkxKAiMn5S1QMmH9aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(316002)(4326008)(8676002)(6486002)(6916009)(66476007)(86362001)(38350700002)(66946007)(66556008)(33656002)(9686003)(6666004)(38100700002)(6512007)(83380400001)(33716001)(4744005)(8936002)(44832011)(6506007)(52116002)(26005)(186003)(1076003)(508600001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y8F9ZXsEkzpAfhOnyyFP9/xxkWRk9uAILo1AbKZLTjYVOh1N7au2UABD2NH8?=
 =?us-ascii?Q?LpqGOK7ppH1XG6ZO/WBhJRuJNhGaVaZHj+mCA+sEWo+x2w6COsDBBANcKvgp?=
 =?us-ascii?Q?ZqAKmFZDiP55vOQ4nNbnsuksI45e4s7yWueSXL/7pIvppTlP3p5slKJr45j9?=
 =?us-ascii?Q?Qwog6FpBNl/gCIBrJGGP1Cht65grw8C7/kBZ4r5mNJbOHwyOBQ2E26W6hVdc?=
 =?us-ascii?Q?5FGoym4PfcNZc3yVhWsFrwOFCFlRkYYXb8IekxeXbyVgw47KeS2HPwFGEn8S?=
 =?us-ascii?Q?5pnH39FznWC5eIMAwCMN2PXV7bOm5Jab+XUnqisdpLH9Zmx7LhHZgHwcNyLW?=
 =?us-ascii?Q?Zq0aPr7Ww0FXHsCTEG8uzv1qfDygiw3UZ/D1EEz0AZf8c5sZ3hzfIMg9dReO?=
 =?us-ascii?Q?8mtsgqqVNgoAmXZEovHdCZGiEhGex496R4osOKl43zVaHOqvbIkEqjOpXara?=
 =?us-ascii?Q?mDC6zLaYYO39rla+cK4KEck85XGgNEjizroz1PRK7Z74YlkD9KkpoCaxoZ06?=
 =?us-ascii?Q?hHLXj2S8hX+RVOiE2duAOXVhFIOiftPxznu7yjN0M1ww3qcQSE8/bQscP6Cy?=
 =?us-ascii?Q?KIiVi10i1cH6tvcV5x9oaHGLOzglyMy2VvoM2vs6tJhbUmk0CqZb4aNM7sH3?=
 =?us-ascii?Q?0E28McDNlrW6MpwUumJgjTPKH9uBwU9AQcfq4TNsGEt5tR4IUjdnXVE6Evvd?=
 =?us-ascii?Q?JljIKrWf8yzGydKMcDm5xsbjkNAoQnpCK9vKDHJtXleT0ExEMCqIo4uRCOil?=
 =?us-ascii?Q?laFtI6IFtDMyNd6EFBJFNvN+Qr1dlUEO0gs7bOQEf288NTp2cYtkRDZrS+wM?=
 =?us-ascii?Q?ZJNa50subDJM3q25zl5rbuRH1lFRx86a6T4XTpBzti/44QeylDWMD1sgLLkM?=
 =?us-ascii?Q?I0VOIfEcdpqjMyqLT7Js9ayZ3oHSInsRFr+mSK0x08zUhlUSAibgiK4PdTEk?=
 =?us-ascii?Q?mFIb1ODDZHse9iDB0xCdmqrABwOpHg6h0aX+SksC3C5bA9RMYaDlyAlC4xtn?=
 =?us-ascii?Q?tDb8nEal38qdEwQuZEv63UtzushlyURYgt5KLcRdLwFoz9QbSkG0OF+V81Cw?=
 =?us-ascii?Q?JYCdJ+IOWlJnp8I62WnHgfDGJYfoQGqoXIWEyCSvh0OTW4XIyHBNJZ+GVQl1?=
 =?us-ascii?Q?ZLgITXGFEQiIOFWaufg02xzYvFRuSC32Vx1mAdrdQykobmZBJ83UqphkqEZ3?=
 =?us-ascii?Q?R8vufhTljcbEjFXrXrPmQITaaqTUiyEL1xyzByQ88BNdpVlLs90vokSVTZLn?=
 =?us-ascii?Q?hLgFhJMQ34PhGvjabG79zPJVNpGdAiDthcPczbjNskfUypg3EHdkrPc6UcIf?=
 =?us-ascii?Q?CRkInwNjVbEciAP6COcCvNA6QlVWHDB2Z0FA36vq4jHCEsX1xZo+pP6MUA93?=
 =?us-ascii?Q?NHmBQ64vOwIXhLOkknxkfSbe6CSj/z8uDMpSJ4+0URw7Zos2TZqp4/xXN79x?=
 =?us-ascii?Q?Hm5SFoYUFRkr4JxE5IIwRD8KVLrnvHR7z0FPZ7Di4mH4Dtqa/dwH38Faaa6b?=
 =?us-ascii?Q?O85k2IiXL5NDBhjT0ZIwJqAo5za5jnVjD3b1zLI50b+MksjqOm+z8t2C6GlU?=
 =?us-ascii?Q?XdwvK5KtGTVtYOBvKIiu5Ms/9QINlcKK9AzOAUs7g1CqdEoqhDAZ3gf0WxzC?=
 =?us-ascii?Q?ll+zblcCzbK8aL2ADbrWtGmxKyA7WMvyT53WszV/ca3tk8vleQDgWwAA1tqH?=
 =?us-ascii?Q?juL9SjIfPdS/m2eXGTkA0XKThTzXuxTurRqCfXxwCmEqv+8PLJLPZcm0ZS6j?=
 =?us-ascii?Q?mQyOgC1hZtoS0hVwmAHEdXIf5FzKYkE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e1343f-c0e1-48f4-4875-08da22969050
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 06:25:29.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b18JOo0b/FIp7B6MuZgTXDHJdpq/05EeawYTbE+kRJd8heNEbrWaI0y9ckjgl9ZlYNQDCEnLBCZeKBwRpSsXnXOtEXzsJgXisYWtI8oCous=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5122
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-19_08:2022-04-15,2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=960 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204200038
X-Proofpoint-GUID: zea5fmuMhrF0jdHRhgOj2eJ1TOSCKV99
X-Proofpoint-ORIG-GUID: zea5fmuMhrF0jdHRhgOj2eJ1TOSCKV99
Message-ID-Hash: 2ZDSEKI3VBYTSFPZD3GAA37MGDYX6EDI
X-Message-ID-Hash: 2ZDSEKI3VBYTSFPZD3GAA37MGDYX6EDI
X-MailFrom: dan.carpenter@oracle.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] Staging: greybus: audio manager module: make char array const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2ZDSEKI3VBYTSFPZD3GAA37MGDYX6EDI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 20, 2022 at 01:37:55AM -0400, Ian Cowan wrote:
> There does exist a warning when running the checkpatch script to
> make this a static variable, but there does not appear to be any advantage
> to make this change.

Heh.  Don't send patches unless there is an advantage.

This patch breaks the build.  You need to at least try to compile your
changes before you send them.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
