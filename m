Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 369966C00BD
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Mar 2023 12:19:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DB50543E55
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Mar 2023 11:19:12 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id EF1873EC46
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:19:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=TUYsFGhB;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.104 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CQbZdqTfpVu04Ol9krfmhGs0dWnMUsVc9ERV0IPCHsY=;
  b=TUYsFGhB6RGQGpI5HNU/e8R5tyhjwlf4NekFFoOVsbSn6Z9yBI5+1zC+
   b0PatNixPTPwidnW79TDtgImtXTt5+zc4Gf5bI1XdxIgeB8YRtn6k+8tN
   uCpT//ok+WFIFbWDGccRY+2JB5uoaLu14janzobW89CQnykZzxFcQsllJ
   A=;
X-IronPort-AV: E=Sophos;i="5.98,273,1673910000";
   d="scan'208";a="50605204"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 12:19:06 +0100
Date: Sun, 19 Mar 2023 12:19:04 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EF1873EC46
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	RWL_MAILSPIKE_GOOD(-0.10)[192.134.164.104:from];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[inria.fr:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[]
Message-ID-Hash: JXXMI7ZKCLJHNOGFSLBKDFOHC4CZZ52Q
X-Message-ID-Hash: JXXMI7ZKCLJHNOGFSLBKDFOHC4CZZ52Q
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JXXMI7ZKCLJHNOGFSLBKDFOHC4CZZ52Q/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sun, 19 Mar 2023, Menna Mahmoud wrote:

> add blank line after struct for readability as

The log message should start with a capital letter, so "Add".

> reported by checkpatch script

"reported by checkpatch" or "reported by the checkpatch script".
The first is more concise, and it doesn't really matter whether checkpatch
is a script or something else.

> " CHECK: Please use a blank line after function/struct/union/enum
> declarations"

I guess the #define was concatenated to the end of the definition to show
that it is closely related to the definition.  With the #define, it seems
rather natural, but the better soltution would be to make a static inline
function in both cases.  There would naturally be a blank line before a
function definition as well.

julia

>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/gbphy.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
> index d4a225b76338..1de510499480 100644
> --- a/drivers/staging/greybus/gbphy.h
> +++ b/drivers/staging/greybus/gbphy.h
> @@ -15,6 +15,7 @@ struct gbphy_device {
>  	struct list_head list;
>  	struct device dev;
>  };
> +
>  #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
>
>  static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
> @@ -43,6 +44,7 @@ struct gbphy_driver {
>
>  	struct device_driver driver;
>  };
> +
>  #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
>
>  int gb_gbphy_register_driver(struct gbphy_driver *driver,
> --
> 2.34.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
