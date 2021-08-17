Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0CE3EE5FD
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Aug 2021 06:58:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2507B61269
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Aug 2021 04:58:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id CC78E60F1F; Tue, 17 Aug 2021 04:58:37 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4CBA060B00;
	Tue, 17 Aug 2021 04:58:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2B2E060768
 for <greybus-dev@lists.linaro.org>; Tue, 17 Aug 2021 04:58:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 28ED960A5B; Tue, 17 Aug 2021 04:58:34 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by lists.linaro.org (Postfix) with ESMTPS id F2E8160768
 for <greybus-dev@lists.linaro.org>; Tue, 17 Aug 2021 04:58:31 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17H4tYWO023260; Tue, 17 Aug 2021 04:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=mNOKc0miFebOl/p51CijROiOkS1QdjKypugIWQoCgD4=;
 b=ZLPSl56wQ38NuW0mDW9lQOZbMmO7UO6BNfA6K5FmFtTEhxaryGWW5xUKTX05tIcFhPjI
 U8NJqCczY/+kZSVa75SvZTMhCzcCANQKMgQW6y462p+Y+PpMEURprlGIZml52XnYKf6b
 5rCNQ4HecPtL2zgId+G2pKKrpS8nLz8Y8/K/IqlWlgzQFvypfU4GQ3mYoMLamM0THCTJ
 yLYKA1mFbDLMyEM/OddB5d8zDe1VAxQfI8OX3ksMiFBOa9LsCwOXM9xf6FCJfOuZdmUx
 faopumFhyONVF1WdCgm3fE51aNgSTWFbtIEEnk4Sx2uHOXT/BAXX2k/ZRC5iMhsQOSEZ Aw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=mNOKc0miFebOl/p51CijROiOkS1QdjKypugIWQoCgD4=;
 b=Al49+GtGouBHBQe/14OAoKXazUAU0+Bs4+5hNcRfn4sOVEt9RjRvrFpH1BtcvdaWgsmJ
 Qx0PfdMsQoQ8xP6MHTKcxK0e/BoiIFQWp/bQyvY0k9vMakzbRogj/CJmBmaxGCKOEGCT
 63oqLZUC19XgzwOuJFZMdO7gdLqOaKzuZRO6o//YAftYOG21hAMAOgGaLD50BM/bL9qZ
 p4lAhea2gnUzFfEcyzh5dojeirsYXcbF13zxQFpyzPbhLYEDXgbCAEBNK4saEdHqLv0+
 qtjZA7BT9gcMr8+7nQWjaY5p4MeX/7I8g7HYg4lKv1R/aC01N+nuQRlE6+z44AmQqxnU wA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af3kxum5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Aug 2021 04:58:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17H4sxed094087;
 Tue, 17 Aug 2021 04:58:22 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by userp3020.oracle.com with ESMTP id 3aeqkte164-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Aug 2021 04:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dk8ppo4nRVW8Z6/3HjhvBRP3JY1A3xv0QoFJCSb2dDXPk1YXnUEOBV4KeMfrHtUfZai5b7l5MQGgULqZSB4L2LvaJ+bd1DeNSDm2NbEObLiYoLf41oa/Vo7UyG+R8zIaCFFRxfw+arJOOHOpH7jp3BGC9bXYxzk7vjt03ljJsESdTEDZmgGYjwdbsJ0mMUvYQYXwwx1giIH/NSDq0A+ZMZtDPyOH20awaYgUFX/jPJ+f0gs9DmaCOfnJMjba/f3Ua/E9nukK867+sUMhErsdGrLDN3bjo+p35laajwEYqViDFE1qHZ6AEXDC6H0rMdZ7x/bzviJ8GLqKp9eDN2FOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNOKc0miFebOl/p51CijROiOkS1QdjKypugIWQoCgD4=;
 b=L3zOa8Ql29Tics3GWPS9L/pmz1yqfWb7qcWze8sUTKeWGUPNYirPOlhoGqalHnq9Yzn+UMN8xJpeJSqdhy6TIiX4/g2DCBNUD8B/LePn08WqGDPZ5VmqsCcIOtzO+7a23UkRA9Le9wIT5N8DTSzX2AkNPm4f+j3a24BlMkbWrLier0q6xliDIMRs+X/TudZKcIIvNhU6sjI2EEBlkqeUSF8/oLVbcvcKFWKK0J7WyK0+Z70TMpaiUNt1KcKP3EQ4pFbojw6/3FtbtThY783MbQlpQO1IlZIo6fEU2jqui0GPYdNWad1j44+rxL2v1e4hQpUysoHq9MC2G03VCfcqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNOKc0miFebOl/p51CijROiOkS1QdjKypugIWQoCgD4=;
 b=u8JUiG6lGVO3YIEZtRpYXIya4u9ALlTPb1+HZFVUZJl62ZDHW2Y2DEtqECbr7kBUM3L8CEypk5LVA9Ic4Q+CwcfHjz3zmgOZohWq8qOOIYkPNvZCqnqZb9ObphINnbym97/LhVtP8RuVxRjtbFsReifhhcVEkQNeYSljXKuZfx0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1245.namprd10.prod.outlook.com
 (2603:10b6:301:9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 04:58:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 04:58:20 +0000
Date: Tue, 17 Aug 2021 07:58:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Elder <elder@linaro.org>
Message-ID: <20210817045804.GI1931@kadam>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
 <YRp9rnCardsCukju@kroah.com> <20210816150653.GH1931@kadam>
 <687f29ce-6245-e549-9b7b-7cc2befba962@linaro.org>
 <20210816183639.GF7722@kadam>
 <e37b5a51-29ed-2a91-6285-aaa8885e0b9c@linaro.org>
Content-Disposition: inline
In-Reply-To: <e37b5a51-29ed-2a91-6285-aaa8885e0b9c@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0005.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JN2P275CA0005.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Tue, 17 Aug 2021 04:58:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b22efb14-18a4-4e80-b2b7-08d9613ba255
X-MS-TrafficTypeDiagnostic: MWHPR10MB1245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB12456D962FC1C2C1C9CEF3A68EFE9@MWHPR10MB1245.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwlay1Qap/QOpFnWxb6+UmvvjMajd7dZKH3Br7ikzs+mtkqvC8p5c91dLApjLa77qRXqrT1P9p8xmdsjJmH/Y0UtGe3WLLePSJUo7uV8//WsP+/M+FJBEDK7FRyO02S0kCaRHeYyNBJThdc5tG59KZSfsB9o0lrbYiRwQbGsukjLodUq3JPoQEp7S+I1mQzT0/9hX62hqM2LHPSznl/jYfHI6qIi+QIByruKL4gspLHw7PDRVzwb5hJXGC1ovFQkDup+I0wu2cn4cesyMRhbzrCJEGL4nCqhWILXUxIZyRaB99FC7gjoZUZJebfEzf1P0OVywHqq/DAmGQQj8e2hTGbA2b40MThjIZQiIbUO+tcbrJoDzKhDNk+U0IiWqA4c6JxsActx5V3+6kjFxd4wez0TQGO5N/WW8qpxJV4JAWEj99wrFgq/TRaMhFjwGTHHVTMJhECm41B/lZQBkP3Yuo9DgBdBS2LMwYINK1k3xgqLfyN6hL9OFvSncsauZ3idupnCVBlf3lnt4jNiv9o7kOE1osFCHWLEQSNb5Z73ZvWNaNNrtW9zUBb+2vQwguMHMshWUk0ZraPwDY4xWFbFTRcnPC3oGYvyoLKBXflmG8M4mt8JlCMhBwSs0figAMWwubx/+BacyDFL0Q+NsIanHK4qc61S8ES771taYAcxwTlE4N3GkRO2cK2hUwNJuylS5C1eSKvaShdxUIXdhh4xNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(396003)(346002)(136003)(66946007)(8676002)(478600001)(8936002)(956004)(2906002)(6666004)(38100700002)(38350700002)(86362001)(1076003)(9576002)(6496006)(186003)(55016002)(54906003)(9686003)(4326008)(4744005)(33656002)(52116002)(316002)(66476007)(66556008)(44832011)(5660300002)(26005)(33716001)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/+I9yDkj4LGRm9zpF5XBAL4QhZBUmL561oKmvgheEHn7lwDA1GRqns1hfKH?=
 =?us-ascii?Q?5sXTcpIyIhrLyfrmP09VhmLkLQaWJydg4/tI3PjXb2XZXu4rVUl5IGsD7mwg?=
 =?us-ascii?Q?1IJA8Crmay0oHBFtZLK6Yo1j5afOTtxspj3EH7olP2NZL8pQysb+utRLDa7x?=
 =?us-ascii?Q?k9uV8qa5kpk4K7drfMAKkq/lqp4811WrzDYvj17GVMQ2iHhi3G6DE1gx39Bn?=
 =?us-ascii?Q?VGRnsFFXacsBDMxmSKykXeJWp8dBoV1SiWKF7rqkrKnH8tyBI4bIYReKquMs?=
 =?us-ascii?Q?Mj4qXRxMHeQWXYArAKfSy4NoCeKWchIpPip7pPud4YDveufGY37UjvhGgYYc?=
 =?us-ascii?Q?XfjKzWHaYRRICRErEYbCc1nuL7cBvwkoQy0aGG60F7qnBslCMeZPDU3n55Mt?=
 =?us-ascii?Q?Kf4MBVy0lH0BoQRrUPcMa5BIuGl8OBlnKCm33f7S5MOv4eZR7B10uzn6YSdg?=
 =?us-ascii?Q?Zb/voMGItyLNRoIRmBoJBuF0F/AuCbA6I1UxoRLNa7mt3ID7EWmQE50qT8eC?=
 =?us-ascii?Q?CLPHkxG3m7HilAIqKMUZDb6AYWnL9y8PQxBcAFl/g1Gb7eiRrgvd/SHfvbUI?=
 =?us-ascii?Q?+8A8kpBtZVhjGS2KhxbNogvBKDYkM/f8svIwYn81lftSa+ru2Blu1IC2CF6x?=
 =?us-ascii?Q?y5YMEwc+l9JoYduqEYlTa7PyrWTUgHG1Ryuupe83vMwo8zBabNrv9IxsX31f?=
 =?us-ascii?Q?xbqhQ8iJFMgOROJtlZQSYb5oqSV4PfXBaKZ819rDdr5bV3pJt7VJQ+XUMWaM?=
 =?us-ascii?Q?jspmrQi4Myhsd+1TjrmWwrLmAt0+GYhRmFzIuLq64nTiYuiCaCJqC1F9YtYY?=
 =?us-ascii?Q?j+/nGY/ZvbUT804u0EY2aeXA6i8GuR6eA5+Sb8NIFfRxDyFKql7oWFuat79U?=
 =?us-ascii?Q?uxzyzqOzZIdvhuHg2Aasb8Z9JzkDfRQMZkNA4fA9ssowiKNKSTwlwlu0T0o2?=
 =?us-ascii?Q?nYtJ3SCxVEqJ7e93RRIwCMu2j3jytLm2Z7Nz/7KyFxFCsf1pRl7ecoIla35l?=
 =?us-ascii?Q?inRZZLI+qYKHClLb3UgbXhGQ6LtWqigZ9qsAvhZLeBKEcMVe+22ozz9GFO2s?=
 =?us-ascii?Q?JnonCkI5RZkRa3zFjQvIe26N2oueEKS9tK2S1uFFbptCPZ/bX0O9IWTv0H/u?=
 =?us-ascii?Q?ZwWa/fTauRz3hxjgXU58g5Z5RZ8hDZe+EQcTJA6kcBuEFAnmRUhlykMcfZHW?=
 =?us-ascii?Q?gPNZYMN1XuvN1ce1K+oh/gk0phy5Q37DOIotV0jvPj3uBmKADYgA+m9Aau8O?=
 =?us-ascii?Q?Gi5Nuy1NNyOJ3N0YRt6eSahO0mA+zLJUEfx29qn5qjYxtVedIQ0pUq30Ph+N?=
 =?us-ascii?Q?ll2w39a3+jTFs4mFUe16au40?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22efb14-18a4-4e80-b2b7-08d9613ba255
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 04:58:20.5694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q628VuJXLdKmKL64a1vcWgEWge0QTq7qXXMN25IdtsWFPwnDR79ibuICp4EB0M2aa0emd9Fq0T6VEWON6Co6TJz2ZIIMvuwEPlVA+WZavHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1245
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170030
X-Proofpoint-GUID: Nxsq_MgwZvN-0WCy7Wfoi0lOBTzpGn3U
X-Proofpoint-ORIG-GUID: Nxsq_MgwZvN-0WCy7Wfoi0lOBTzpGn3U
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: Convert uart.c from
 IDR to XArray
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, kernel test robot <lkp@intel.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

I'm about to leave for a few days of PTO...

Under my scheme checkpatch.pl is not a fix.  We would only credit people
where the code would get a Fixes tag.  Complaining about style choices
is its own reward and we don't need to encourage it.

And it's not really about me, either...  I'm happy with amount of
credit I get.  :P  LOL.  Plus even if everyone used Smatch, I'm always
writing new code.

Anyway, I hear you but disagree.  :)  I'm off for a bit.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
