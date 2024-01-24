Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F7E83A810
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 12:38:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DC12940100
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 11:38:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	by lists.linaro.org (Postfix) with ESMTPS id 29AB53F086
	for <greybus-dev@lists.linaro.org>; Wed, 24 Jan 2024 11:38:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=intel.com header.s=Intel header.b=Z5fZQnAz;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=none (lists.linaro.org: domain of ilpo.jarvinen@linux.intel.com has no SPF policy when checking 198.175.65.15) smtp.mailfrom=ilpo.jarvinen@linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706096313; x=1737632313;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4KDkITjThVdXmK+bUfn3eDscOtSdUbZiuDnwLDTI5eE=;
  b=Z5fZQnAzWketCuAZfYBBqmBKmDwO2T6cxkOA78eKiE+vUvVzUiewZO5i
   KHZrd51dqv7bNgnkdGH27VYUKVMQQ3l7jtBphJ356WfWfArc+PNwNxo5b
   w6sBvoxNGTG2X2XCgjzG7DwY/KBn/z48xTx03l23O6M+mUV0NgY2CRM0f
   hDdC1wsbDItGs2LH2k95XQs68rVbjgVwur/PzZVk7n6nuUTSj+hkqCHzL
   nqufUlFiBYbow+gCZGx8YVYmZo4lpD2NX90Tms1mtbQHmcbTYj0Xgwil/
   ZvRAFCLTjcOIKlJ4cuc1/4ieHUzQdNh1jESpvX11+hUdW3zmuXVh5oKtr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1691932"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400";
   d="scan'208";a="1691932"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 03:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820437647"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400";
   d="scan'208";a="820437647"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 03:38:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 13:38:18 +0200 (EET)
To: Francesco Dolcini <francesco@dolcini.it>
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
Message-ID: <7d4309e5-fdcd-13d7-2d4a-7139779e3fdd@linux.intel.com>
References: <20240122180551.34429-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-695447939-1706096298=:1372"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 29AB53F086
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	RCPT_COUNT_TWELVE(0.00)[30];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:4983, ipnet:198.175.64.0/23, country:US];
	MISSING_XM_UA(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	URIBL_BLOCKED(0.00)[toradex.com:email,mgamail.intel.com:helo,mgamail.intel.com:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,chromium.org,huawei.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
Message-ID-Hash: QPRAFULL6ANTDLVBWQV5SXCQQQCTZSL7
X-Message-ID-Hash: QPRAFULL6ANTDLVBWQV5SXCQQQCTZSL7
X-MailFrom: ilpo.jarvinen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, Netdev <netdev@vger.kernel.org>, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial <linux-serial@vger.kernel.org>, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Cameron
  <Jonathan.Cameron@huawei.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QPRAFULL6ANTDLVBWQV5SXCQQQCTZSL7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-695447939-1706096298=:1372
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 22 Jan 2024, Francesco Dolcini wrote:

> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> receive_buf() is called from ttyport_receive_buf() that expects values
> ">=3D 0" from serdev_controller_receive_buf(), change its return type fro=
m
> ssize_t to size_t.
>=20
> The need for this clean-up was noticed while fixing a warning, see
> commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value")=
=2E
> Changing the callback prototype to return an unsigned seems the best way
> to document the API and ensure that is properly used.
>=20
> GNSS drivers implementation of serdev receive_buf() callback return
> directly the return value of gnss_insert_raw(). gnss_insert_raw()
> returns a signed int, however this is not an issue since the value
> returned is always positive, because of the kfifo_in() implementation.
> gnss_insert_raw() could be changed to return also an unsigned, however
> this is not implemented here as request by the GNSS maintainer Johan
> Hovold.
>=20
> Suggested-by: Jiri Slaby <jirislaby@kernel.org>
> Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@ke=
rnel.org/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-695447939-1706096298=:1372
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323328-695447939-1706096298=:1372--
