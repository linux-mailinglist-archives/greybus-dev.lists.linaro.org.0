Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2943EDD29
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 20:37:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 749526098B
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 18:37:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1A14060A52; Mon, 16 Aug 2021 18:37:24 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 968506090F;
	Mon, 16 Aug 2021 18:37:22 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 875DB60780
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 18:37:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 65CCF608D5; Mon, 16 Aug 2021 18:37:21 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by lists.linaro.org (Postfix) with ESMTPS id 3893160780
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 18:37:19 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GIacCi012652; Mon, 16 Aug 2021 18:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=z2zSkq2QtjMmCX6qedCG1A5CjS3YMK02HDUKRqnf/WU=;
 b=M7vrwYCQ2Fml3X+bbU/GtH0koLbw32B8FYJrSmJyIZibxGnj2mtMErMxCRamdkBEzYlZ
 hh2DE/spKefWoGVdtsu88RrPyB7iAoW7ow5+3OcHkcuI8IlqusUS+lEoxj7SzWeC+8c9
 6owiTlF58cKhz9pgdkiiW6Aj2BnFnNDYTYpP1xDvrzTK3WqHd2uQcbpAPW9h3zEJhVz0
 uJKbrSkwRSMmpq89hJayyVdzlvKwcp7P0mOZh3tro0oDaMJDcIlufe7ui108S0LBkcgq
 jsaEYLV8TYuPPXfA5fl7FTKpnk9PiqEJ25GR+KeUEnD/nNgavv36DOBXfI5amBfU71Qu iw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=z2zSkq2QtjMmCX6qedCG1A5CjS3YMK02HDUKRqnf/WU=;
 b=HLcFCdDPq1QlX9LnzuPRsbSB9VIa+QN+ps/eeSDpd1KYDUpDxgGV6C7Nzmw6TcFIE/Yf
 Arf5PxjljWnL51ou4ihuki3ojwTq+TJ6IVi9Z5DUJ46zw+lBin/gm1yjHMPY1nU4T32F
 btFGIHo5nOphF7Baxm8ozm9i1ycv81ub03L/wSDsliN+4laqHMyMiX8ihyJaq5XrEuQx
 9SxXoIRQJZLBzfhEQYAtSaMTcvl7eWje/N+R63vKXeLyc6uZmfbCbSO0QguHug41GqrJ
 UtVg/ITc3kmv4+xYoxNEtVGCb2ojmys2Qk+drSvqnlGpuZqxQCpmluQxAM0j1vDXzmjN UQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af8302kk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 18:37:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GIYqgu176733;
 Mon, 16 Aug 2021 18:37:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by aserp3030.oracle.com with ESMTP id 3ae3ve8atb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 18:37:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug2P44b3co97rx0cn9Ew6DL8eRFiMHyfxVGFITduN7Hp7ajyBszy6Cgrv+dG/nMMXkSzcbGWNL/2BvD1T3VJWlna5v/DhVR/8+1CaToHEGdfegogHnNWGhiGCjdnJG5O4lJAj8U5OepoPIfP+IP29sqn/U7iRuentirhEPh+V2ya85m/VtiN4l31uxc+659mqQG4ERc8oM+LpHSnXCOQOcjNQ/X89quDox5/qGt9dSYG+vWzqw8Rz767dNngeC/fCHuLuk1wwCYtT0fnoKZWShYvCt08mV4lrCtmPn6WEGqTHERXB7FSVImtf8+DO4WjSqkL8vLezX1nuOsr/+W4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2zSkq2QtjMmCX6qedCG1A5CjS3YMK02HDUKRqnf/WU=;
 b=ScBZZL5ALBr614+XTJlL+G35Wafrdg2CXmh7BxP5WZEt+S1dIZiO+X6WN4/L6mcVHvfsqTEaeNWOvqA7jMMq5+QB/QBYOMdRhgGL/adTSlRf7YdinxkkM2/Q7QZOCoxwG+ZKVG5ab/oR56+nzaJ0Sj3QkbwRDYp5SjzhUl5TILqB6L5Z92Z34w4IWuna5opht5+SIKBUso8noCPRsIpDwHxmVOccChT9ilVjXWXkVBLhyLDetLJLI+5yDQgkXsORilPBuiI5Hhb3WuAJ87Av6shZ4xgIeK6HpzABnL8xhSyIIqcaobKWm+n113HgnPQK4EHOZshytE8kR/SeU8Q83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2zSkq2QtjMmCX6qedCG1A5CjS3YMK02HDUKRqnf/WU=;
 b=paN6cX2+iDw1DGtEPyATMomR1BzsTkVlH7LpcyofW4RFBIO7u+pFCZVxuVPjJTdH1/o4/otCrOA0joVngZKeBii6slC9ax3hDzTYoqkWdCAXJOcCMr1UxojJuG6Gwr+sPDjPURM/y06jw4NisTD/WmFNYorSS1bVkRDWbhK0S1g=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1293.namprd10.prod.outlook.com
 (2603:10b6:300:21::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 18:37:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 18:37:09 +0000
Date: Mon, 16 Aug 2021 21:36:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Elder <elder@linaro.org>
Message-ID: <20210816183639.GF7722@kadam>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
 <YRp9rnCardsCukju@kroah.com> <20210816150653.GH1931@kadam>
 <687f29ce-6245-e549-9b7b-7cc2befba962@linaro.org>
Content-Disposition: inline
In-Reply-To: <687f29ce-6245-e549-9b7b-7cc2befba962@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0035.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JN2P275CA0035.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Mon, 16 Aug 2021 18:37:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5494aba7-2abc-413e-c70d-08d960e4dae1
X-MS-TrafficTypeDiagnostic: MWHPR10MB1293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB129339978C4F7030CD1F283D8EFD9@MWHPR10MB1293.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1QYJL+EDT+7jiw2g1Zj/v0swrk9r/DKIVh33j7cKUnJCfZcMhWaAV7RLd656w+XYEw7+cbnHmnAc6XcW6MlacNOXCq26o2mUQ6yh2zax0UQWvqsPOYzMA6xJKCJ5/KjLHGvn+tP9zEH4X9HYQ2rEvUuw/+8q+tV8uSchVjfagyRfBYPAd76F12UZ+B+BlOv7s28mV7J94kBU1NOZoUi3KNCQlDov9L+7G4FmEHeXw1GhRMX42LMj0B3n8Ifs+JkBxvvcBxtCwYlq2DD/+bUUZGQ8nD88gs5SK2u9rAUZTrcox5aFL6m9I7efTmRlj6ivGALMyyW1gZJWIC1j1rDRFCA3f+L/d5mDhQw05fmjiQjLfX5zjgP36diT6LfszotGLcEvotudiimjOIc1IP/q5V1DReVbhYJCe/FZja8VZKLli5v07LCvvLpAfRPTwSpdjQiFewgLIdHiNhY4aIlKFs3heeo2m29k2U/lqhbLhDfkVTbFtkYA0Yii7bWwB8sNpc33nLh2My9TyaqipSEYgOg26U1kE1g8cl3PYINpqm5tTtoFmtc9XsaHQQ0u/fXHvL+C12iEokgq3W4VY5t4WsjMJTWShxpxgtIqosufFAb0TEH5maQ/wDRMy2UXct1fln+dgXMYQbySZhhBAQUOPMKfYBIFnwyK5G7ApA74n+S6Aw58WJsqMCmNe9RHQRjrkZJKGJQnuJehggjjxIipA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(396003)(39860400002)(346002)(86362001)(26005)(6496006)(52116002)(956004)(66556008)(66476007)(66946007)(2906002)(8936002)(9576002)(33716001)(54906003)(38350700002)(38100700002)(4326008)(55016002)(186003)(478600001)(9686003)(53546011)(6916009)(5660300002)(6666004)(83380400001)(316002)(44832011)(1076003)(8676002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oOkgRbREiATKGfGV3Xvexjj87Yx9BRKBlnPQ4h+9C5S9Vf/jOJKRNLSgaS5i?=
 =?us-ascii?Q?b5yvEdUtpIgRGCKI1+JGRqTKvkKqvnIitI/U6kI8MsUwU+4Eo+CFP+1r4TJl?=
 =?us-ascii?Q?Khmv5/5ILJmbtWUG+PJgKMRNJtwTxsbZba1yH6UeXsKbI3NhE7llg9NqRHOY?=
 =?us-ascii?Q?uPUcUEiVTCCU7o57ABgCqFzGj/Y5lwqDqM36DxPKA2IUg5Ktoxd43Tzf4u2e?=
 =?us-ascii?Q?fciM/zYbp3wS/G4j8+14U/zUvlQaOhglQ0TReeFT2LclRubCF86CBlR540si?=
 =?us-ascii?Q?qTALPBoIGT7b1rg0v49daAWBmMgfUtToGKUdPQGXiTc1eQzJiBu/yMaZ6nQB?=
 =?us-ascii?Q?vVCFCi/z1fdqDOMz3b7sVXy0DnIMfXRWeAIMzzD1Y53hPDKMEMvqJ/wNpzto?=
 =?us-ascii?Q?GbNyi6hjWn4jFqcRqQgQWXGNOfo4ePwAN/1IUwqKCFSv0kTJUi3+g+oLpKcq?=
 =?us-ascii?Q?a2onDG6freVB14L1F0nbqr8NdzYGSxv3On9vZJWtGYB+6DGh33SZn+cule5o?=
 =?us-ascii?Q?ccaUWmTDA0dGTQu7ktNQbYF+LxJ0ORBilY34RrkjN5Aj3BFNj+RwXyS5VPts?=
 =?us-ascii?Q?U6sknCyAgszTkeT9qmrTV0ztbsjbPLsUicrnRpm7oHVWq2myQOZhWD93/Rj0?=
 =?us-ascii?Q?5oSx3QJu9PSJCCZxcGCUDrhdkO+fW8AlwuEXr2wRtNkQd2X5nDROVImQpJRK?=
 =?us-ascii?Q?8kVQpXeccTAU1R4GC68iKqaW6L/1tXhZuW27F7Ixnw2jA5Mf3yXsu/3UcFGD?=
 =?us-ascii?Q?Zt/bfB3zEAnEEaypfzHupQ1BZwd3hqSI6bYR24muXot629mcwptduDLBmvLf?=
 =?us-ascii?Q?PG1oN6PzLKrEX15yPLtN8snj70ZfL13n8SbikC1vCVjZNwOaP1f55GgKzxU3?=
 =?us-ascii?Q?+I2Jy+Tx82Q43HN4XBZDsX4QXYFTPxzG3Ed2tBZ+Ao4IJ9lMu0TK8ZaAOKoW?=
 =?us-ascii?Q?S1Reg21kVb9vAXj+jQluWTBgzHICwxahsJHjdOezAbR1t+oWafclMtul188q?=
 =?us-ascii?Q?TtJEFHuFAsSlbX2xYKD5bj4lvC270eBbOQ8C836IM243GzJJWF26qyL2zCKc?=
 =?us-ascii?Q?+IrbUIexe4l7I4tpt9qgVc+6izt3xqcelSI/rBNgC02EG7NljyTLG6Mtd8pd?=
 =?us-ascii?Q?oK26nAy2NmVrt/lgM4knuq7GDuFmHDM1fAT6XbwKyBhQYsQXwudtXgE9BO5T?=
 =?us-ascii?Q?jvAJ4SZ4tUl/NNlP4wjPWAPAXe48rflBzvRFBTlugwEa/ZhhQ0ZdO1OZioen?=
 =?us-ascii?Q?qVVlgHPesNktR3HszVLhCfGiDiy6+LZ4vsG73EWWXYZnKtdXWDrCezvFNtcM?=
 =?us-ascii?Q?hLMvOBQt8i60OAWpnsleUKDl?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5494aba7-2abc-413e-c70d-08d960e4dae1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:37:09.7851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sP3ILKx7UR7yAq7oM9I2xSVYML3UIvFn6T1l0JykSp2Efo6yEH+RZ5z6uDYKTAMT1YRKCtXU08BzZtxuxm+Kf5/sKyhmIPdN6nv3hDlofb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1293
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160117
X-Proofpoint-ORIG-GUID: fChTBrU_AwMREgOJAmCvvH6ZUEiRoNwP
X-Proofpoint-GUID: fChTBrU_AwMREgOJAmCvvH6ZUEiRoNwP
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

On Mon, Aug 16, 2021 at 10:10:04AM -0500, Alex Elder wrote:
> On 8/16/21 10:06 AM, Dan Carpenter wrote:
> > On Mon, Aug 16, 2021 at 05:01:02PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Aug 16, 2021 at 09:46:08AM -0500, Alex Elder wrote:
> > > > On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> > > > > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > > > > is more memory-efficient, parallelisable, and cache friendly. It takes
> > > > > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > > > > deprecated because XArray has a better (cleaner and more consistent) API.
> > > > 
> > > > I haven't verified the use of the new API (yet) but I have a few
> > > > comments on your patch, below.
> > > > 
> > > > 					-Alex
> > > > 
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > 
> > > > I'm not sure I'm right about this...  But the actual change you're
> > > > making has nothing to do with what the Intel test robot reported.
> > > > I personally find the "Reported-by" here a little misleading, but
> > > > maybe the "Link" line that gets added will provide explanation.
> > > > 
> > > > Anyway, unless someone else contradicts/corrects me, I'd rather
> > > > not have the "Reported-by" here (despite wanting to provide much
> > > > credit to <lkp@intel.com>...).
> > > 
> > > You are correct, "Reported-by:" does not make sense here.
> > 
> > There should be a Fixes-from: tag for bugs found in review (not style
> > issues) but when I suggest it then people just say to use the
> > Reported-by tag.
> 
> I think things caught during review aren't normally worthy
> of specific mention in the commit message (though maybe in
> the non-committed part under "---").  I mean, that's what
> review is for.  And in the case of what <lkp@intel.com>
> does, that's effectively a technical aspect of "review."

I'm not talking about stuff like intending or naming schemes, I'm
talking about real bugs like missing error codes or NULL dereferences.
People do count tags so we might as well add them for worthwhile
behavior.

> 
> So I don't think "Fixes-from" (whatever that means) or
> "Reported-by" make sense for this type of update.
>

Earlier today I forwarded a kbuild Smatch warning where someone had
used "sizeof(0)" instead of "0" but because the patch was already
applied, that means I got Reported-by credit.  If the kbuild-bot could
have reported the bug before the networking people applied it that's
more valuable but I get less credit.  It's a perverse incentive.

Also I sort of don't like the Reviewed-by tag.  I see a lot of people
adding Reviewed-by but I've never seen them point out a bug during the
review process so that seems pretty worthless.  But Fixes-from means
that person knows what they're talking about.

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
