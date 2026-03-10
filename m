Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NhNGBWIsGl2kQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:07:33 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F45258192
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:07:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 15657401BA
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 21:07:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lists.linaro.org (Postfix) with ESMTPS id 5BC1C400F1
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 21:07:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=oH955PFc;
	spf=pass (lists.linaro.org: domain of andriy.shevchenko@intel.com designates 192.198.163.11 as permitted sender) smtp.mailfrom=andriy.shevchenko@intel.com;
	dmarc=pass (policy=none) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773176849; x=1804712849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QD0ocCLo29LGXqoE2UpeJgKKNEmmXUqDI3RgU/UG4UM=;
  b=oH955PFc4YfGQoq7aYFG3uEcOiPXc1UJFxKtvi22nijzmdFlavrCaH5F
   Lae4H2qB+wuJC2aOihCWnBm6W3Np6r8lRoXZ6LdPKkSFbX8uTVNul9zmD
   Kebsz2M6yM5SdamYIrfJpUg0wOK4cfWtjfHbz09GO8XMEx16RVx3H+8cZ
   ZgRpRXW24Q6urHqE4K9jG+l1VWmzVoeMSLMsFjGDQSeTkbdyp6R8ShLkM
   lCRaJY8STRxL4KT1EKLQRAM+kLXaiJJIz8T02mTFaeAx26VmCBZxHScVe
   AC2n/5UOBCgP8Nu+QlEEnAde1XzZ7GZRVNmaYPphLBnDE0X/kh9soKe5N
   Q==;
X-CSE-ConnectionGUID: pWN8TjvERNyxEpEiyWfXvQ==
X-CSE-MsgGUID: A/K1eta+RQOljuOjGvkn/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84867492"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000";
   d="scan'208";a="84867492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:07:28 -0700
X-CSE-ConnectionGUID: uZWVu9RWRJeylP2ReXAurA==
X-CSE-MsgGUID: MPB2+mqHR0uif6GIR6yszg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000";
   d="scan'208";a="216978035"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:07:19 -0700
Date: Tue, 10 Mar 2026 23:07:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Message-ID: <abCIBPZzZBfMoOtm@ashevche-desk.local>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-2-sanjayembedded@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Bar: -------
Message-ID-Hash: TKUPKUDL63I34MOCV6LPTFMO7BSEN7ME
X-Message-ID-Hash: TKUPKUDL63I34MOCV6LPTFMO7BSEN7ME
X-MailFrom: andriy.shevchenko@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, pure.logic@nexus-software.ie, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, lin
 ux-staging@lists.linux.dev, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TKUPKUDL63I34MOCV6LPTFMO7BSEN7ME/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F2F45258192
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[intel.com:-];
	NEURAL_HAM(-0.00)[-0.955];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,ashevche-desk.local:mid,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 01:35:07AM +0530, Sanjay Chitroda wrote:

> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().

...

> +	struct gb_camera_configure_streams_request *req __free(kfree) =
> +	    kmalloc(req_size, GFP_KERNEL);
> +	struct gb_camera_configure_streams_response *resp __free(kfree) =
> +	    kmalloc(resp_size, GFP_KERNEL);
>  	if (!req || !resp) {

Now this check should be done in a better way.

> -		kfree(req);
> -		kfree(resp);
>  		return -ENOMEM;
>  	}
>  

>  done_skip_pm_put:
>  	mutex_unlock(&gcam->mutex);

To complete this, one may add a prerequisite to use guard()() first.

> -	kfree(req);
> -	kfree(resp);
>  	return ret;
>  }


-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
