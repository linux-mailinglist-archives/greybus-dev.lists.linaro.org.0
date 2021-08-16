Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C543ED981
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 17:07:41 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25699609BB
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 15:07:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F219E6085A; Mon, 16 Aug 2021 15:07:39 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CC81C6090F;
	Mon, 16 Aug 2021 15:07:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B7A8E6085A
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 15:07:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B5422608D5; Mon, 16 Aug 2021 15:07:34 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by lists.linaro.org (Postfix) with ESMTPS id 8E0E26085A
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 15:07:32 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GF02Vk030932; Mon, 16 Aug 2021 15:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=HI6vCVudaokhkDjzifZPJapJ8B1UCmX2wd99iQvMJxo=;
 b=CLrzxLDcqFmawJ2t1IyAyGeF4CHyL5GYdNVs36o1LY15YGtIe26pDKNgU78vYOmO5nXC
 rsat9c2mWnQ9AphGq+SVrNYktSgCxzEgM46RmEm2Tfm/smstTnb1sGKQLAF9cz9g7GQj
 M7XMvpKCjmMxNd/mt99FaFmgwf/caWb+MDyaA01qNhDrJZdo3z1VkymFm+ln7sptSwld
 zwYhk6bMBUwJQw+zO0IyH4Hgj13Yl0uOfy+HqcJyAitHBDNayNPEmXdfOLDW/tu+CEH0
 IImLxCJVdqD4KDwx6GE9AlDrPUE47/hUk7qUzsQSXFeiQ5Ti8S0dfGakJgVaCBqbAXGW Xg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=HI6vCVudaokhkDjzifZPJapJ8B1UCmX2wd99iQvMJxo=;
 b=S9n5mpGDmUQUEJFPP5Jp95DFFoUDFIJhuT0+av/zg2MIAgBEkwAK517bxIZpcXgUlflT
 PXl7pxWtI31KVdG+vCG3xv6QV6btLsydcnkRspIHV1H07714Ee2DNog+h5jI7rRPiJXh
 lDcujk7H7G0LRH1kcKjYq1HxbEGu5iF5RiUwFRn+UJu0tmAfJPbMf7s1wwYYqu/hGID2
 5OMlxCawPhSDGM33X4XCEQSdA+SI6oQfEESCp3y0WOciGMNDA0zX+FrC1VO3OX02uOnI
 qfEcOXjRpIPG4Sy+fWLIAyeeyd7aQBxswldOH6OwNKt3Mr2yaTM6CTCcMEFa/Lu68KZ0 yg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afdbd1nrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 15:07:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GF6wMB193374;
 Mon, 16 Aug 2021 15:07:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by userp3020.oracle.com with ESMTP id 3aeqksarfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 15:07:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNhOKRj7E4zt/NhfF37XGs8xrf330S6IO3+megiSwNquJvtfxRlxbOKRp/zJNy8ovF2E5PanQLFODqy4hmIu23xll7hqogAwMVAIxLTUUQwLu5HLfmQuxgTvrzDGTwS/m9j+U9VsGx3eCC3xsi5Wcm3tP2fay3Ggw6TAwx0VU3hkg1uTk2MoNlBcP1fI4mn2Ei+pDlhL1FaGEA5LcRBsEXI4Yf46v4QRNBk4a4/kZUojt+ABFFrX5FGhiSqTLjb1aRoJ8LoRE/2EF/xw2w7okaFPwVjMZiRMWSzWmHw/smhkufX0afYQ5+9r0wjo3MTVij7g+qDawk9SwatMOrlQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI6vCVudaokhkDjzifZPJapJ8B1UCmX2wd99iQvMJxo=;
 b=RabJ1kLitR75MOvhesqWnLfRjxv4lhT/hAfyPvTqKgy+562A7ekZqEmEiXnOecIUsdWhx0aXH/w5wh4JoePsmIw+mTfC4Xl0pNz5vOw9Ws7IWvBnQm2iDhfv4duMLak3XaiZOSdt9c2MLbI8+yBhfrmSiaPFW7t6hdGgt748rzdkk806enrXzoFYrV0pMZpIQ6BKFJOY03zqS0J9waV+Fcnpy9Ds9SDosTLMS0eMr4uRLPW94hoCoeN6A0hyh+Xdv//dRYFK0IHrhzYbkWs/IhqxQob27ZRjkElBYMwD9K02sJV6VpZw5u51amhL5JGGgdLGDxxIKfM/caytwVlk5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI6vCVudaokhkDjzifZPJapJ8B1UCmX2wd99iQvMJxo=;
 b=YjatTNCw7vvsEt+f+VMHTjNhhjHoQdJsvO/1Xd6vKgXt/DZANiIteXbxNXlrJ6JalyMYGf/k4gNIn3kNhqq1KGkKfCMC4zsTYg+MfmDpicpb18q0/vAeeoqdtMDledTJoIIzsnJOiHzMWs2uzWpW3fKSo7lxQA66WTqj6mXpDfA=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4658.namprd10.prod.outlook.com
 (2603:10b6:303:91::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 15:07:17 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 15:07:17 +0000
Date: Mon, 16 Aug 2021 18:06:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20210816150653.GH1931@kadam>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
 <YRp9rnCardsCukju@kroah.com>
Content-Disposition: inline
In-Reply-To: <YRp9rnCardsCukju@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0007.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::19)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNXP275CA0007.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:19::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Mon, 16 Aug 2021 15:07:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76801e98-2ff9-4540-3e58-08d960c78968
X-MS-TrafficTypeDiagnostic: CO1PR10MB4658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB46589379C0B0F7238D085E488EFD9@CO1PR10MB4658.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+C73x/yXmx18VCcb8Fc2O1ufdREop5IBbDNFpKpU6+zGplUcIIn0RRp1HOgKTCWsxhqxSWJPL5V4S2l9ewVGhtHYia1JZR3VBW3Up1kFzKG3lbUOq+CQiFjanB+e1SP3zxi8FApa4z+Bh1nPgOQNMuv9FozCeZf8J2hYIE7URzVIot1qLfcRmT7GRvc89zZwMIpI92jpNvxAa/kkVBEud3hqxQn3+W7zI/SSDTVQ1k9r0C0j+jaCRGYzBpmYFBp+oPasGzS9WbeDm+bRBKV5gFC1vYxihJcYc/RlbmVUA8IhvFvMBnAfEdHUJRLsJTmmF0EH+Hwse4G+mfarcB6XDlpTZf6l63JJ8+AezMpxufedjoFThziQD4s6MZ2TMIVzIaBZ5OCwYUbqdrmMxUxZ0Zfe63pon2x/JYkA55UbQt5Q4uV8RLRn8vuHjzYw52tywn2jhdMqz/0+l+WF4SdDZYm2muL8BDDzD14gEeK8bf1Mxt03HJN3S5IbkgLO+0oZDU8Hr8OiEeRNnW4RtgBI3wjQEEwwgMO8VCH+0753EZx7YmLK8Kl3jdgzRuCRmaWS2S6V4uDaytXhannhLhqWQjznPCXKjvNcwgKiUpMJ1Zme4SahF+1radSwpBtzx1zpcgl+eVV/Ruo8QbNI81ZPnYtefls1AGJCX1zX/ZP0Bo40uySUYSgq9dmlNHmj896FQdFUP7hlXqf4v4DZX45jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(136003)(396003)(39860400002)(5660300002)(55016002)(9686003)(33716001)(478600001)(66946007)(6496006)(8676002)(8936002)(66476007)(66556008)(52116002)(6916009)(53546011)(26005)(186003)(9576002)(6666004)(44832011)(2906002)(38350700002)(1076003)(54906003)(86362001)(956004)(4326008)(38100700002)(316002)(83380400001)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3jkOYYfU/5NTo6advrkh+UtZRSAbveRdIM1omJ0INQ4SZ8uX0o6qd4G9nyiT?=
 =?us-ascii?Q?EW5jlKEMR1OwP13D+kqauqsq6t4gFYdoC5McnDWsZVqgbxAkPI2wbiS/PnPc?=
 =?us-ascii?Q?//aTFstdriO2m7DO6HJ8OdNritnymeqU9kovJBLgpfO942Pnu5PAGXQhGJnL?=
 =?us-ascii?Q?7wtopBp/bmZNd9v1M1U0TnvYMfZV6l0LcjiCLwEvieWha6lSufop6V7c1rhW?=
 =?us-ascii?Q?hyQxgIlahm2SZqLY1LKdlQ2cB001z4ios6R39f3xetp4WeCN7QHEvxqXCols?=
 =?us-ascii?Q?PnwUgWOnVExq5LHB9EIJ6J5s5g4C0KKRBQSr+lySspQn23hEhn8fPkxOyj+9?=
 =?us-ascii?Q?lYltDcAf51PL5cRrgadulDsDbyQ2/5q0P3ZkgRkSFEKYYeUo2zbdV7ePfUn+?=
 =?us-ascii?Q?4YThGnVE2s0FH0u8B3/7B+6uL/ZV0g43nhC4OwJTySsq1MFrPPiakrpkvq1C?=
 =?us-ascii?Q?tW3b2R+kcrT8phtrc6SpfSHWRT/8z1I0Ryz4FxlnnlE+CbVz0BPHx+ugHGxz?=
 =?us-ascii?Q?Z/ddpUmz1FdE74Z2x6J+8O1pZEwrKeDsC2eN4OpilZgx1W0gbZIGjiq4I/cq?=
 =?us-ascii?Q?ArUIxtrRfUXU1cNsvXPcu1DA86bmqihXvjzvt/z3NGZV4WO+VWkJr2GJ7nvL?=
 =?us-ascii?Q?00eUJtOA8PRuWQc5TVFjjqcLYS4MiKke0v3+79CWi6ZDP9kyEsbdJkFLDWGA?=
 =?us-ascii?Q?icvfs5YC9T59MawBC4n/vwJg4YL9hmUPNJRGQe1Fhwr+d1bdRjEa3XdfijbD?=
 =?us-ascii?Q?iAIrgvuHEu2UVzyptyIaGpY0eiWu/smpurenHtpDM6awRPgdUIgD+qtVaOy+?=
 =?us-ascii?Q?ALC2wvxoYqL2Me/ZbDrEVPJUFsH7Imi4i31xyMh5scPNUU6Tg+0Grxsnk4r4?=
 =?us-ascii?Q?mMrvqj0MeZtdijvfqFSVxvhUxYAuheg6k16PI+fX10pZYm2UvImCR5Uo3oV+?=
 =?us-ascii?Q?HY2VdV7OI6QKV8/+B6FSzMXLcu5eLITN9H6p/QN0hlNq9ykh8rgSjLWBZZ/M?=
 =?us-ascii?Q?PUYrmBtnAObOn8C+1R8WSMHiJnwPz7l4qAeZq06Oo3guD7UFlHlZatK+zOyy?=
 =?us-ascii?Q?rK14JInQHHTflobcs81VbFhPq8A+SNI6z452n3gDt5YlA5vEz7+6W/2sLxZ+?=
 =?us-ascii?Q?EcOtlg6Ug48qYWjECuMwkGM5ZMgUE9oExuYXl28exTghmYadXJPulpXyS3od?=
 =?us-ascii?Q?QDxgku5uODNJINEm7Hn5z+/5B2c+YyOHqoZGyVkTXGkSSLFkgCw705UrtKDA?=
 =?us-ascii?Q?L0Cz8IBqSR7Orqxe7u8ut4D8/+F0O+pffNTai6uQLRKF4ce2geu01+fztHXZ?=
 =?us-ascii?Q?si40Aygwq1gSOcF2qTAagy3U?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76801e98-2ff9-4540-3e58-08d960c78968
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 15:07:17.5521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDbZmQg93PKJvM7Q1Ha8FP0PubA/RZyNPxv+SUZyBdL8St1QD0WfDzx1xkLpwxYBSmpxiBl15spTpqAhdu3xAvZeesubamZ3HGL29WvH3Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4658
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160096
X-Proofpoint-ORIG-GUID: -YLon_cbF5KSqKYYLpOKFVdJThK6IdvP
X-Proofpoint-GUID: -YLon_cbF5KSqKYYLpOKFVdJThK6IdvP
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
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 16, 2021 at 05:01:02PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 16, 2021 at 09:46:08AM -0500, Alex Elder wrote:
> > On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> > > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > > is more memory-efficient, parallelisable, and cache friendly. It takes
> > > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > > deprecated because XArray has a better (cleaner and more consistent) API.
> > 
> > I haven't verified the use of the new API (yet) but I have a few
> > comments on your patch, below.
> > 
> > 					-Alex
> > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > 
> > I'm not sure I'm right about this...  But the actual change you're
> > making has nothing to do with what the Intel test robot reported.
> > I personally find the "Reported-by" here a little misleading, but
> > maybe the "Link" line that gets added will provide explanation.
> > 
> > Anyway, unless someone else contradicts/corrects me, I'd rather
> > not have the "Reported-by" here (despite wanting to provide much
> > credit to <lkp@intel.com>...).
> 
> You are correct, "Reported-by:" does not make sense here.

There should be a Fixes-from: tag for bugs found in review (not style
issues) but when I suggest it then people just say to use the
Reported-by tag.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
