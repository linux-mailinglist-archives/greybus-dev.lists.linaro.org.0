Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 758363EDD36
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 20:39:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7909C61179
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 18:39:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 63D4A6093A; Mon, 16 Aug 2021 18:39:40 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 245976090F;
	Mon, 16 Aug 2021 18:39:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CED7460780
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 18:39:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C2B28608D5; Mon, 16 Aug 2021 18:39:36 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by lists.linaro.org (Postfix) with ESMTPS id B356560780
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 18:39:34 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GIaBCT006392; Mon, 16 Aug 2021 18:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=9nH0HX4815bx+ISfgZvhqhQTs9JqreMwD9pUdgnpu28=;
 b=wzehQEXoX7NRkrJxJcdeOlU5HVtFl14xP7AqVxtcPkdovILVnYg1C4g+shfqbiCvfisz
 6EsUnw4iexYJSQE+jRSnBOZ5nZ3QcZgoMT/kO+ghbSRs9lXPqPDhSBpngRLZHh58oYcX
 lf6owDPyY3+JtwFyEM34z8cA0gk/MH03fbnNlhbQ0SCDTRfLLhUg9gQXVhwuNxrJN8vR
 CA+EyVW74phULvj7TmR/GJy6Zv+3qp1No+LP2wrusJCJ5ZFaj618vWgdxKK0qd6pKNdn
 kGdbKfu/wQScPsA9y0o9kBZ1wRu1M0DjauHubkkewyAnerA5Fi/fJUdC13Y5V6E+r6/j sA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=9nH0HX4815bx+ISfgZvhqhQTs9JqreMwD9pUdgnpu28=;
 b=yLBoqprBaf3FYttIF64KnQMCAohBiO3qV5Q2oZTyI0yFgoE+2B0KO36fi9DRJ3sX85yu
 6XcTd/sW/6nTKmxs9H2OPBkKXjbE9kO8ad8WG8TCsqKVEjpWVXAUXakYbHWdI1sK/Kjw
 qxvQ2KVfL6YYHlkD7K0Y4uw5FpChwtKJ114AM9lK69b2l1zKa4Z1/aJ8YzhgjzOjML+2
 RQ098nCEjecZhyt5m4PAjj9Um4R0XQBIIp3nvVlZFcKmJJixNggWyl6AmODFNkR2Q8Lb
 kkF3LoyvpHslrcjqfOzwhejSavc3OcziYrErSVv9mQQbI4pEIwzWGrMchQhrlmjTHVoT 6g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgmb9wcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 18:39:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GIYvaR048178;
 Mon, 16 Aug 2021 18:39:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by userp3030.oracle.com with ESMTP id 3ae2xxpsrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 18:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZyWFBxsiRdHfd/rdww3Pjq6fTY203UM0ro9hPe2mY1kZqz2cMRBGyM7PUv9d7as5ZPWU3rbUYIZEDvr23fLCSceHA04umw8ljusL9L/Kg+iMPCxd4XbMFSKpwSlm6HRpeVbmK6t9Sa2AE/OiOF+laxHpNPZFSUXcKBmy4EFbHfYDeG+LZ6zQm51J2FmyYkUWKXAzfiCeBYoLkX6z2di9U/K1qcPIsOJnP5lvrhKHWZ30j4b2lHbNVr3SOyDlVcMqSyL/uFGw4SDYMVnInR5z+JHdd3OhLOjxhp7wAwuGwDSk/dhUGWHGCfYhQkk1UFA9N+QFZ88GNgPCIhrcECxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nH0HX4815bx+ISfgZvhqhQTs9JqreMwD9pUdgnpu28=;
 b=A8NPVUc1TXkCNgJ9+RvHF7R7tjz20gmK6NyCC6iFRqkl5GJLlD59b1SjHzi4DuMU/2Jo4jf5qJDVDSIn9xclbqaDhbzFIbM/vpYj6l7yqCWs5RGV6GjzpjYkvMsmLfdvMU/OGPFDW2gkyvZTHgmr10i/zBTf1dUTzWxdLDbEPZ9zUX5zTvnvk/Gi1cVLpQE8EiGdrXJrufiRXlVeikTNjJXtlmDhNdkYHQEGp6H5n0cyBPWVUCwoPlDczY7OWNh0q9CYg0KSoq3XYY0udcx0gjwkt8vkMs+GTdPvMNiaw4Y/WAfUO6ZCM4jljhT1WAGVKw1HX0/zk/cuQPhLBIzEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nH0HX4815bx+ISfgZvhqhQTs9JqreMwD9pUdgnpu28=;
 b=bOyVWiRJC1H4LGaEsvBl1ImJpJHKTj5vYQtn2G97W5RUNoyKdjqcEK2zLc4lk4qx8IqJZ3lNzoTAQcSzO460C5KV5maU3WNZoIbDG3r6u6orWcQ1gPCrdavMRt/2cBvwRmxFGUtOn8U/CmNpDbb11CG6//pU4csc75YymLvwlbg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2160.namprd10.prod.outlook.com
 (2603:10b6:301:36::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 18:39:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 18:39:27 +0000
Date: Mon, 16 Aug 2021 21:38:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Elder <elder@linaro.org>
Message-ID: <20210816183859.GG7722@kadam>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
 <YRp9rnCardsCukju@kroah.com> <20210816150653.GH1931@kadam>
 <687f29ce-6245-e549-9b7b-7cc2befba962@linaro.org>
 <20210816183639.GF7722@kadam>
Content-Disposition: inline
In-Reply-To: <20210816183639.GF7722@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNXP275CA0033.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:18::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Mon, 16 Aug 2021 18:39:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4873929-e427-44be-83b2-08d960e52d75
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2160B8C3721D0481600E35F08EFD9@MWHPR1001MB2160.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rRo4nZYvjCx6iV0SjTqqVtvDGbxsb+B4o4pNdUPV9HNzuhEM+arGrB5EXqeK3xo0eacjbj+aXzNPrO3/PLWjuZ1Q4Eb50hnu/RKljLm4V60zKoQHEhNeUUvmjn3BR0GXJq8843JvR8meYwDGo+medlT9Lh/lybhh4K9GJ3154bbI8bEw6yjPlN5rLJBVqV/X9cQpPUIee+Le16W1CBJ1MQKAq6wnAy50xgNzODIvo4saIUnyd9choEisMR9Ld/kd5LyAQa0TJG8KRwuBit8sCSgekkZdJnfHPUxuryhtfsAM5oFo2bdcFGUKM9tOPb/Q4ME2fvSVoRKXPROuYlWoKp6KGs+SFIRMXfPjhTyEdVXodOcXpisjjnlSjO+jYO/NWgUak3ZOvDEDsSzw3QJCgWnHqvsmIDZqEiY4Z6A82YwhAqS6mJCZTzwavjT2e/7Ck+Lp30CduhAlG0jqvv3lq2Opr8ZP3grOh2quxBq82L1bKK1qyTKF0697Y3UD7zZ8Ibw/Rcqy4GUxgm/B7vYgzjIJ9cKsmZg3reL44VqnkRI8q3muVasVNVoQOVHut32H3X7GLKPB4/GlLRqiXin18WBAS6r7pIscJWJjJwNs2lzIjR0mbvRsqQngs5sBoUaa8pl463sZsASfIGdErXSShYn0tGmPfsuJLq5YglZJ0MzaCnMUdTn3qnZDpKG5u7q/RJWuJUJuBV9UXr2kIcp4ZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(346002)(366004)(39860400002)(55016002)(1076003)(53546011)(33716001)(66946007)(52116002)(54906003)(44832011)(6496006)(478600001)(316002)(6666004)(5660300002)(66556008)(66476007)(9686003)(956004)(8936002)(4326008)(6916009)(86362001)(38350700002)(26005)(186003)(9576002)(38100700002)(83380400001)(33656002)(8676002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DDk7+je6tn/GYGZbmS9t1cVMLziEz0mpbfkypzHyDntZJ+0Qk3oyi65hexlz?=
 =?us-ascii?Q?eoLuzff5XcsaI2jFpLwNpVRTqcLu5jWexSaZ4CAiLtMHTMCv4wL4zy7ONeBZ?=
 =?us-ascii?Q?+akWgLhQdixZSAZHZEXmw6jxPGWxnpXEbuqJq6SF5mVmnJdfJjV7H0H0Gmv/?=
 =?us-ascii?Q?W5WMxxPIXj7HT7ERMpJWT35VQEnPWGVn192kFzycQPJ/EfQW2gsqV7qfibBM?=
 =?us-ascii?Q?JQ5fVYAMEGFMXPLtWfnfK7t0dtfPzBbLXQ8qBre6D3BmPIDevdRhpKW/sDPz?=
 =?us-ascii?Q?nRs2iMGBQNLGlXWLWMQG7Q6Vk8dJCoB5KjRDJSGUN3P4HiiK0DD+V1U4Mi5R?=
 =?us-ascii?Q?eybyc5ejVET2KYsuEsMhpW/BNGBpXFs6hr48DkswoWfoG926HiPGMl4f/HiL?=
 =?us-ascii?Q?RovCBnzdfBCdr/wmqZr+dSUKE11DXgBf0Ju6tfgAQ6dLf1Qq7fRT+Lw6EOQt?=
 =?us-ascii?Q?mJB2Z+k/DpmTi4u3NBmFs0R/s7/4pfiZE1lQxEel6CZh8+65WRDOgcdvyG/K?=
 =?us-ascii?Q?cWrC3Do8vDr6vypFLfLpxUiK9EKaOrOztFFDW1Aluqz8CWy+E1i2HyvrTK/A?=
 =?us-ascii?Q?GBPlwhGMKPDkljdPR3+cKQPmzCiuSQi58kfWDlNlWkLHnCU+oNqp/2GouP6H?=
 =?us-ascii?Q?AadKOV/Vylevfx/WipCIXAo9IbCkAv+t9o0kVFpysms9WWRYPQKX6/Q7TN3c?=
 =?us-ascii?Q?Ht2FF9+BDPI4NK3V9VW/hrom5pQnP4IosMQ9E6f+QASxd6zeKiuZHPCaYACe?=
 =?us-ascii?Q?5gr2bw9LZvby9zj3bPtWThizw/yD954UpXsQ15ue51A4YsQoSb7m58QfFzET?=
 =?us-ascii?Q?cC1tMBkuhrbM4FqyFRM/kDtr9PRFiSyIaXAeIB/TRBMo3JLdXPnouhdiLtIL?=
 =?us-ascii?Q?sNdzoyaTjaTc/zFoUG5wFovoU6dTDg+R8XmBD3JrrpceLvytChU757019dR5?=
 =?us-ascii?Q?jjJ5DK/cp1BUaojnCnsuuK5U1lno5WWwLnEc4jxJHZhFnda8/KigcJtEtdUn?=
 =?us-ascii?Q?abNoLI9Mqj0EOMlZX0nTdFMNz5yqhAyFFn0MWdZjmxtUBi/ZHgtKSQ5nCNGE?=
 =?us-ascii?Q?OCamAa0s+1Oy730+bv/wAO+g0EOWbp6IiNaerkK4WcfQZsKQ1B0q66Mg5Y6v?=
 =?us-ascii?Q?zr/oYH916YOYYqXFSUQXivQIYCFCotJoi/V1uUC1F1W/Vp4JU+z8bPR2ZGk9?=
 =?us-ascii?Q?ojdBTn32AdrcE3BvoAzM8ubjGqgmAqLyYzuGsJOQBBSUFoR7Sa3PxdawfaTt?=
 =?us-ascii?Q?R6nLxR5I38fWR6PlWtVdc/afsCL9lzNypthVSlk5OnpFh8eF2PD2+z7rcY7p?=
 =?us-ascii?Q?BSTlmMk1BFjjZQY/AeAezM4o?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4873929-e427-44be-83b2-08d960e52d75
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:39:27.8148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: No4az3F6c0RnivFWCw6kchkQTQIaPQY0UXuSwOZJZ4OEz471EHiaq2rzZhn7R76sVukcTE97yGUhAyY+Ngmgr9nbd1QGTea6qpLr2tX+2kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2160
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160117
X-Proofpoint-ORIG-GUID: s1PQHLu4-pkm_PDS9FcU64GyVFEOiPIL
X-Proofpoint-GUID: s1PQHLu4-pkm_PDS9FcU64GyVFEOiPIL
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

On Mon, Aug 16, 2021 at 09:36:39PM +0300, Dan Carpenter wrote:
> On Mon, Aug 16, 2021 at 10:10:04AM -0500, Alex Elder wrote:
> > On 8/16/21 10:06 AM, Dan Carpenter wrote:
> > > On Mon, Aug 16, 2021 at 05:01:02PM +0200, Greg Kroah-Hartman wrote:
> > > > On Mon, Aug 16, 2021 at 09:46:08AM -0500, Alex Elder wrote:
> > > > > On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> > > > > > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > > > > > is more memory-efficient, parallelisable, and cache friendly. It takes
> > > > > > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > > > > > deprecated because XArray has a better (cleaner and more consistent) API.
> > > > > 
> > > > > I haven't verified the use of the new API (yet) but I have a few
> > > > > comments on your patch, below.
> > > > > 
> > > > > 					-Alex
> > > > > 
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > > 
> > > > > I'm not sure I'm right about this...  But the actual change you're
> > > > > making has nothing to do with what the Intel test robot reported.
> > > > > I personally find the "Reported-by" here a little misleading, but
> > > > > maybe the "Link" line that gets added will provide explanation.
> > > > > 
> > > > > Anyway, unless someone else contradicts/corrects me, I'd rather
> > > > > not have the "Reported-by" here (despite wanting to provide much
> > > > > credit to <lkp@intel.com>...).
> > > > 
> > > > You are correct, "Reported-by:" does not make sense here.
> > > 
> > > There should be a Fixes-from: tag for bugs found in review (not style
> > > issues) but when I suggest it then people just say to use the
> > > Reported-by tag.
> > 
> > I think things caught during review aren't normally worthy
> > of specific mention in the commit message (though maybe in
> > the non-committed part under "---").  I mean, that's what
> > review is for.  And in the case of what <lkp@intel.com>
> > does, that's effectively a technical aspect of "review."
> 
> I'm not talking about stuff like intending or naming schemes, I'm

*indenting*...  *sigh*.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
