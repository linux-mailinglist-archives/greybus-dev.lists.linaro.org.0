Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3236D3BC4
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 04:18:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6C4933EC79
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 02:18:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by lists.linaro.org (Postfix) with ESMTPS id AB47F3F689
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 02:18:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=h4IbO5p4;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}");
	spf=pass (lists.linaro.org: domain of ira.weiny@intel.com designates 192.55.52.136 as permitted sender) smtp.mailfrom=ira.weiny@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680488303; x=1712024303;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+1ToTW1kgJvCUO2bpsgHQ1WS4/8I3N6wT2GWQit6pg8=;
  b=h4IbO5p4P461LuLGrFKtRHet8L49RZju8u3rtjpFV81THOWQId06leG9
   mqsbzh1wn3nk7Kr6nMSN4GiMlnYlxF2uKn837vJ8UzMEDcD9aioOUrMcX
   jFDgFaLovEyOQlqnQs2D74/I/hcJYJrvkIZI2ZgzrPe/xth2kj08ghjfu
   wqZW7HfFAVawRpwGz2BmI3In26qV/jXEdRGARabiMA6dip5X3XEOELOlt
   6JPgicq1rOEYPMOH4q3FIA1ml42mZ1oXb/EGxy7OrpruOhOP9r93my3am
   tko66uRZPttrs9t1/0wsStU02/wydbr5tw44KCOYLtYOXdHGl/LzrC2Cn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="321451370"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400";
   d="scan'208";a="321451370"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 19:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="755061036"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400";
   d="scan'208";a="755061036"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 02 Apr 2023 19:18:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 19:18:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 19:18:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 19:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9/HmzaihuOnkbeazelvM7x0n84J/w5Wf0lIqihJDX4Ab2pb+1jpkVsCV2eU54soINlfGrawi9cK4Vb3GYqS1JIT6JzCD+l6i65IWdPmTFzUXj/WRbOpAykKYdgFCoe/pLrf+wIv5AVgm1cAqaZzwBhlsE162pF5x7s3VI4CI/ZbWKdBfSDSpIOLqXYyhp3Zvjrbq+unWXBGJ9FUVgWLwKtJHNX1fgckRdr7c/s614QvWqA+LyJpwEv6E4xS6o2K2Ul9VSIpUS+WG7UgugEGU7wH9d02Ovje+5M5z2CmGQujY1aOoyIFTV+Trb1ipmA6sb0TKSoODmVsaaDxiaK9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVR1yOPQL2BGJ62pjMRQ7S/ld0H2KjD8zntHB0XJVyc=;
 b=hP1UP0a92SSpxh0jb7kdRnzn6IsVyqmae50U8DJeu8GeiKc3WKHezknrJJgzogqmkEyFRYBGNspDC5lxvsvtyj7/7irPHFQFAwWQzkUuq5MQDsNtCsKs1jypAxkKvuyX9zsFTlCcs6sYBgCBCYH6kvut3BGAO59YiyVRwqrv6UJgNepDT15NDLsAWkDME+PcgGNp9ICQjn5O4zxxymJQ0F6WZkAro2+2PD0axbBDMMB21R+OzFaeH1zoENxF6OEeLtEj7aK5CJrHNOQ7mZ4QCdMOeieKDC6K1Tkb5JOy+36gmMdWUnKqWogrAN4L+/OgZLyZQiq4MOh+9jIxRAldXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20; Mon, 3 Apr
 2023 02:18:18 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::c5b2:6996:5aee:91db%8]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 02:18:18 +0000
Date: Sun, 2 Apr 2023 19:18:13 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Dan Carpenter <error27@gmail.com>, Khadija Kamran
	<kamrankhadijadj@gmail.com>
Message-ID: <642a376532b26_394c3829466@iweiny-mobl.notmuch>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
 <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
X-ClientProxiedBy: BYAPR11CA0090.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::31) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: d100e2b1-9a98-4e47-a6fb-08db33e9afde
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UohtfaD/1f4Uq2tLuYdLInlpDRzTp7jVzvRi943A5O/o8SESQl57NWWLPwQjmiCKfVL8pjcQNHWfvzkLa1IOasp0bnuwvS7P1YVOXFpXqf6QCIzpvhNBeJeXts1ggsBUXjuszXeZXSFS7dadWtLGCb50cSqIXrJXUzygzF6dy6poxuZhSsJTY94OKo4y7ucmMk2H1gbex0rUWW6YLStRlNUp3AQ9PmLsHBTLcV8eVKjy3xRGDtOdHFAbtu2FAqRwIyTO0rmSaORuTk4M/ooIUoJNo+wnLnOA7JVyPc8Dq7yWhg8UZINpEI/rkuIVdLvZRWzvorz+enRKPGeQNKIZ3BsTE6FW3t9gGW+2aRhdMmME0dvY4fn6JrA042L79ZndvqKfU9ITEcB2HyJgnYxVB+Dc5B/MFDYuRYd48+l6/kBKLeNHiRN/nQ081f7vTytfuUxPbpArWv6t6mUhXGwsYWL1iuYPzosBxrSEswgBcN3o+jiakDJWVAqM25rQrhf5RomgUCP5y/ir+mw7eB62ZweEgE99IPDmusyu8hF9UaRlJaocDA8OvLAsiFPNCmem
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199021)(86362001)(2906002)(83380400001)(186003)(9686003)(6512007)(6506007)(26005)(6486002)(107886003)(6666004)(4326008)(8676002)(66556008)(66946007)(66476007)(41300700001)(82960400001)(5660300002)(7416002)(38100700002)(110136005)(316002)(478600001)(44832011)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X+8m1uP5slzLKVKxc9JLxnIl30BysJHZ+voEIvyHjw4VMvIeVVHRNCLPg6N+?=
 =?us-ascii?Q?Chy0VLgGVRX75UUquwBNMUyLrjmzXmAy96mJUl0nfc5RbYbILIOxNlo+EREB?=
 =?us-ascii?Q?aReeafPq288dY5zkK9u1jYHMak60wBgMS/QKAJaorZjBr/mcNA8ySVc8axEy?=
 =?us-ascii?Q?I4rscvo1nxS27BFC1azAHUxvabEI5FA8XZ7uyukifoGd7JVSOUNaJMfRCsK6?=
 =?us-ascii?Q?WwmeTmv47ceGMY2PhjpeKDgcSzWkZRhCxvyqllZwdC/9HiBTZNL/Ki7k5Ae2?=
 =?us-ascii?Q?tNppfkSsOZ270dJQtAzC3ujqehbG1ibgkr2C1MTSvVTSWFpA2Yuo3x+gEz5n?=
 =?us-ascii?Q?EzHBFxVR61AQppoh5W7mMeE3UNrNV3ZbImZteIDE4bMcpZ9Jiu8uZc5pe7Ra?=
 =?us-ascii?Q?hp1xS0huk+op/o1RyEJwmSHoeoMWMr9frN8jL31fWXbKJE4IXmcp1DVyzIZq?=
 =?us-ascii?Q?LkHj5Q2z7LkeusgWRVfqpC7y+NGKajuuZ/RciwYAZHq/KNLPofsfxftAdjF6?=
 =?us-ascii?Q?IbYVOemZt467F9bINdB71hyYnnpFFeHiolOwPT7RIzsX0qAxkR1Ehe1XJ21e?=
 =?us-ascii?Q?PZxq+kaYpRdrJthvQismDSCQ6EWCTZuFkINmQZkMLa0Uxcdn8r6GbqJ/f+Zh?=
 =?us-ascii?Q?teZ7+dI+o8LGqXlg+S1TfKEpB2O0CTeVGMPLTrzzur4f1C1SilPTy2wNCTxC?=
 =?us-ascii?Q?JKKqiw1H0XDxrVZVJpjU//oLtcfK4VcC73FIw2PR6Ixo6nalfRqWuilxsoU5?=
 =?us-ascii?Q?kAQZRrJTD6wPOb6VfNQ0sNBVdKPc1dovJ1bjxdkHNOaQeeH/kexJpL3h4SUC?=
 =?us-ascii?Q?2T1TskUUaRanS9sT7G3xQkuybKgx2YgloU7T9VVrp4yRZsdA+LTGr7DLL3qO?=
 =?us-ascii?Q?q6bTYVRYh2agwC+eS3ChHPC2IqwLTB+LGhjaRwAUMqh6dChlxegY7I/i/ACO?=
 =?us-ascii?Q?jzUJBT31yHlPc0ClLhdBScH7eyx9wZ+CevsP4fwQ/QhpSctm0WGp1j2Htx7q?=
 =?us-ascii?Q?OFgnELOsSbmvseQMq5M7ODXd+b+TKLzlRQeDkchkKHl9Syokaktp7erPub7a?=
 =?us-ascii?Q?egbdzAo4nnV1amRF0HUt2dqmBTFcIA2GI8eM5ySWHnSs2qqJf2SClvPvewzO?=
 =?us-ascii?Q?6XLm2Z9kd4OGzIedjSPHrwvxsZ17Z4OwoN8FloT7btX+zAgJ8zDa+d4NejiZ?=
 =?us-ascii?Q?GN6Ij63qryr6sQKBJjt+691cb90BuCOT/WCiuRnklGL0+QxjMoKj29K05e5y?=
 =?us-ascii?Q?sk7rrvuLeMGNQKrHG7gVUFDKosXXjXV42v4IcafGcKAZoPTNrexOIzbn7pvF?=
 =?us-ascii?Q?mZWd3uSpTN3mS4cotLcUfrqEXcayMuWnX9J3wrejP+FTIpA65yc/zpKDjonR?=
 =?us-ascii?Q?/XNZG+aIzJrog4lnVxT6INaZ1KF40L8wFr2VCc/QHO73nD2klZidgPx5dZUC?=
 =?us-ascii?Q?mqzSRY0Cgb+AZhFQrP1vc0wyG0B3SvcJ/iW+lRyqhz1Ew3oqaEV/f4KPtlch?=
 =?us-ascii?Q?utOJuHbhnEHCcMZrZiJS4ClCBNSWYvaDwInz3fdezUxblXYMYO8z90izW5Mm?=
 =?us-ascii?Q?qOc4mmR1uOm2wLquQHq0N/Dg2Foax2vFNcsj66tO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d100e2b1-9a98-4e47-a6fb-08db33e9afde
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 02:18:17.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBikX3iQuT8b2ORRnE3iTuxBG+YUBI9RIPSHlmTPj/TBdGUwBfWwVxF52VJ61GCDrK5Hw4E6tqU6hxsMIeDLJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: AB47F3F689
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.20 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,intel.com:s:+];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[2603:10b6:806:25c::17:received,104.47.74.41:received];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	RCVD_DKIM_ARC_DNSWL_MED(-0.50)[];
	RCVD_IN_DNSWL_MED(-0.20)[192.55.52.136:from];
	R_SPF_ALLOW(-0.20)[+ip4:192.55.52.136/32];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:4983, ipnet:192.55.52.0/24, country:US];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: TXSPWJ734P6TP3PTDV6GLA6TLJVICCS4
X-Message-ID-Hash: TXSPWJ734P6TP3PTDV6GLA6TLJVICCS4
X-MailFrom: ira.weiny@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TXSPWJ734P6TP3PTDV6GLA6TLJVICCS4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

Dan Carpenter wrote:
> On Thu, Mar 30, 2023 at 07:11:25PM +0500, Khadija Kamran wrote:
> > Linux kernel coding-style suggests to fix your program if it needs more
> > than 3 levels of indentation. Due to indentation, line length also
> > exceeds 100 columns, resulting in issues reported by checkpatch.
> > 
> > Refactor the arche_platform_wd_irq() function and reduce the indentation
> > with the help of goto statement.
> > 
> > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
> >  1 file changed, 41 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > index a64c1af091b0..dde30c8da1a1 100644
> > --- a/drivers/staging/greybus/arche-platform.c
> > +++ b/drivers/staging/greybus/arche-platform.c
> > @@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  
> >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> >  
> > -	if (gpiod_get_value(arche_pdata->wake_detect)) {
> > -		/* wake/detect rising */
> > +	if (!gpiod_get_value(arche_pdata->wake_detect))
> > +		goto falling;

I don't like this negative logic here.  Can't this be handled with
positive logic?

> >  
> > +	/* wake/detect rising */
> > +
> > +	/*
> > +	 * If wake/detect line goes high after low, within less than
> > +	 * 30msec, then standby boot sequence is initiated, which is not
> > +	 * supported/implemented as of now. So ignore it.
> > +	 */
> > +	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> > +		goto out;
> 
> This checks that we are in WD_STATE_BOOT_INIT state.

Doesn't this check we are _not_ in WD_STATE_BOOT_INIT?

> 
> > +
> > +	if (time_before(jiffies,
> > +			arche_pdata->wake_detect_start +
> > +			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> > +		arche_platform_set_wake_detect_state(arche_pdata,
> > +						     WD_STATE_IDLE);
> > +		got out;
> > +	}
> > +
> > +	/* Check we are not in middle of irq thread already */
> > +	if (arche_pdata->wake_detect_state !=
> > +			WD_STATE_COLDBOOT_START) {
> 
> This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> background?  Can this check be removed?  This might be took tricky to
> answer but it's important that we understand this before we continue.
> 
> 
> > +		arche_platform_set_wake_detect_state(arche_pdata,
> > +						     WD_STATE_COLDBOOT_TRIG);
> > +		rc = IRQ_WAKE_THREAD;
> > +		goto out;
> > +	}
> 
> Let's assume the above check cannot be removed.
> 
> In the original code if gpiod_get_value(arche_pdata->wake_detect)
> returned true and arche_pdata->wake_detect_state == WD_STATE_IDLE then
> it just returned without doing anything, but now we fall through to the
> falling: label below.

I don't believe we do.  But I think the proposed logic does make this
difficult to detect.

Ira

> 
> So this patch seems like it introduces a bug, but actually it might just
> have a dead code problem.
> 
> regards,
> dan carpenter
> 
> > +
> > +falling:
> > +	/* wake/detect falling */
> > +	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> > +		arche_pdata->wake_detect_start = jiffies;
> >  		/*
> > -		 * If wake/detect line goes high after low, within less than
> > -		 * 30msec, then standby boot sequence is initiated, which is not
> > -		 * supported/implemented as of now. So ignore it.
> > +		 * In the beginning, when wake/detect goes low
> > +		 * (first time), we assume it is meant for coldboot
> > +		 * and set the flag. If wake/detect line stays low
> > +		 * beyond 30msec, then it is coldboot else fallback
> > +		 * to standby boot.
> >  		 */
> > -		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
> > -			if (time_before(jiffies,
> > -					arche_pdata->wake_detect_start +
> > -					msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> > -				arche_platform_set_wake_detect_state(arche_pdata,
> > -								     WD_STATE_IDLE);
> > -			} else {
> > -				/*
> > -				 * Check we are not in middle of irq thread
> > -				 * already
> > -				 */
> > -				if (arche_pdata->wake_detect_state !=
> > -						WD_STATE_COLDBOOT_START) {
> > -					arche_platform_set_wake_detect_state(arche_pdata,
> > -									     WD_STATE_COLDBOOT_TRIG);
> > -					rc = IRQ_WAKE_THREAD;
> > -				}
> > -			}
> > -		}
> > -	} else {
> > -		/* wake/detect falling */
> > -		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> > -			arche_pdata->wake_detect_start = jiffies;
> > -			/*
> > -			 * In the beginning, when wake/detect goes low
> > -			 * (first time), we assume it is meant for coldboot
> > -			 * and set the flag. If wake/detect line stays low
> > -			 * beyond 30msec, then it is coldboot else fallback
> > -			 * to standby boot.
> > -			 */
> > -			arche_platform_set_wake_detect_state(arche_pdata,
> > -							     WD_STATE_BOOT_INIT);
> > -		}
> > +		arche_platform_set_wake_detect_state(arche_pdata,
> > +						     WD_STATE_BOOT_INIT);
> >  	}
> >  
> > +out:
> >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> >  
> >  	return rc;
> > -- 
> > 2.34.1
> > 
> 


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
