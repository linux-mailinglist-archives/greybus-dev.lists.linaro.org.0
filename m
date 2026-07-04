Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ej5zHCz0SGrJvwAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Jul 2026 13:53:16 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E6707735
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Jul 2026 13:53:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=ODKTalrk;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C43D6409B5
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Jul 2026 11:53:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	by lists.linaro.org (Postfix) with ESMTPS id 0E8EA3F9AC
	for <greybus-dev@lists.linaro.org>; Sat,  4 Jul 2026 11:53:10 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so13739855ad.2
        for <greybus-dev@lists.linaro.org>; Sat, 04 Jul 2026 04:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783165989; x=1783770789; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk4UVFMOS8PfIShadOTM+14JEL8d23RJhNHQT4BpQaQ=;
        b=ODKTalrkl2qFPdV6ue1XJH68utce2Fhu81w08YxzxwCUSCd0LeQRzRHTCwvkQVYfKF
         yeRjZ9hrUcRug8efG5m4GqpM0FF12gxJFnTEDvnmeV47+ktoJz6gF25wswRHtim+bX+j
         mqo1g6hVF2EllB4uCPdTu8Geo2R5wlZBlPD8Y2w1AGwPFPFZv8eLEprSRQJRyDgyhJ2t
         lBAOLqYRZRt/U65D3ljrvV5b47TnscV7QXgwczulaKKg7t8eiWVz554sgOlOEfAoUi0v
         z8vCcz7f8MJZMfDraQAduWu2BTlvx8zlD1Ny/sgdBkn2WX47E4FnbxruI599L12TYJOz
         CBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783165989; x=1783770789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xk4UVFMOS8PfIShadOTM+14JEL8d23RJhNHQT4BpQaQ=;
        b=pX4MgB7RqvwDPSROdTy3pIidhn1YWYtV0sadeZc6oYM/VG56zuONfaUrBaWv5XDFoV
         lDbtacua4Xj/FO8UzGTlrljeoiWzpvVp+llOGEjOyhYRG+lqEmrcUvCLw/cZgjOcN/T/
         R+IiJwCAzVXNMnHn4tpJfPDVYYs0qSL72yr0OHsprHygRZoGonDKhBcFKcxOUh/oD3bW
         Ho83HWGJKwEqZFcrSL9pgvv9iF0uZywFuGuQax7RX1xeaFgORYJ2HId5Y3OVO3G1rOEg
         jmaTr8CJaztKBJBpKb/nJsFOb9uU0Vj/OQCRZk2ncZg0PA6uVH131lzN9EjbrIcmxA5Y
         nwYA==
X-Forwarded-Encrypted: i=1; AHgh+Rpov/qDtKVdgu737+gwQ1qFht/8X9H1m1uTM7N2S4Hb1QT67+nkbuEX+6+3smggPcqXZ0huJiarwoC2NA==@lists.linaro.org
X-Gm-Message-State: AOJu0YyzGKyZtmWkngNgHjjxLweW3gPxMbZviO8X76NSC83vxG51cKIc
	BRCwR1UvH9mLxeCy80Is7mC7pVGa5TLw0X0U+wWMX7YHobvDMxBBQR5k
X-Gm-Gg: AfdE7cmsh4pGL7jg66ciaxnty94L/WcoQPthcp9XOryVKx8e6tc0oC1ZtWE8fYzPuaX
	ZKVYARgeWYdAImgetMvx69Jqt2DGBzvYIJopNd9IbjYrVA5PB1VZR5QzubFTYVu6ixVajt0FcvM
	dfH4A3maBvJuJznofHj6kpkNlbtiXIrNu+O/bh1lcRs6tN4l1K8igjd+Q4nfIAKTppPz+iYgkFP
	g0pDJ7l1WijIQ6yk/r9fHi9ON5CZmrFfawMNmBP6roDJsXUHhhdSFG9BvRz9HTuGZUL4mmWMtXk
	VRdWsJHf83MBsn6hRpGIldQFCNfIs+K+32qW0soZjpF//5Ki5IL70wablbpoiK4KXHCqfGvowWM
	f3KEqEFB/AOBrfkbDCOUC4YDhC0OmLpLlbSS/yUyggNcyz1EKc9ZVsA3oG3diru3N7VvDTmOeDw
	3f8jNo5BkthyTfitwGGI+wX2an4+dJm/ljaDw2w4rs/8RgHr9T6ehT9LM=
X-Received: by 2002:a17:903:28e:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cbb808b0bbmr29120415ad.1.1783165988953;
        Sat, 04 Jul 2026 04:53:08 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm27577974c88.4.2026.07.04.04.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 04:53:08 -0700 (PDT)
From: adi25charis@gmail.com
To: gregkh@linuxfoundation.org
Date: Sat,  4 Jul 2026 17:23:01 +0530
Message-ID: <20260704115301.7113-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026070430-exclude-improve-f318@gregkh>
References: <2026070430-exclude-improve-f318@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: /
Message-ID-Hash: TDSKNRWWPVWHUHERNAKWKIPMKFBRBZ26
X-Message-ID-Hash: TDSKNRWWPVWHUHERNAKWKIPMKFBRBZ26
X-MailFrom: adi25charis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: bootrom: power off module on timeout
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TDSKNRWWPVWHUHERNAKWKIPMKFBRBZ26/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB5E6707735

On Sat, Jul 04, 2026 at 09:34:47AM +0200, Greg KH wrote:
> Cool, but how was this tested?  What hardware needs this?

Fair question. Honestly - I don't have Project Ara hardware, and as
far as I can tell it's not really possible to get any at this point
(the project's been dead for years and I haven't found boards
floating around anywhere).

So this was build-tested only - compiles clean, checkpatch clean -
but I haven't been able to actually trigger the timeout path on real
hardware. I based the fix on the existing gb_svc_intf_eject() usage
elsewhere in the SVC code, so the API usage should be correct, but I
can't vouch for the runtime behavior beyond that.

That said, if this driver is effectively unmaintained at this point
and changes without hardware validation aren't worth taking, I'd
appreciate knowing that as well - happy to defer to your judgment on
whether this is worth pursuing further.

Thanks,
Aditya
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
