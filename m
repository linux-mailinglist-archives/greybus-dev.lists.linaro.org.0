Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7397A4A407B
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 11:51:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A942B3EE30
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 10:51:14 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id EF7A83EE23
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 10:51:11 +0000 (UTC)
Date: Mon, 31 Jan 2022 11:51:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643626270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1HrP+Vgt7n8HpLZHmiyqAEpK9Ixl+Sdp3tB06tFj4yc=;
	b=aGcD+R4O0eu7ZleuhENO8bvx7FAC54O8C7udu7gGgCzpcy58KmGtlMzLtXubTSOQQUOnUJ
	qZmGkIyx4Y8o1hDWUbQUZ5OEkMWSB3mXFSHH+TxeNar7MkxjuvkSQpObE212Cts36kIKoJ
	2L3B9UUJ357lZju+xXEVCb85G4euGPy8GE4Ithmkr4VEMkkRM4WhUbG+9qYM2w2bX5fzn6
	cZYAK+LP2LPp7zd6FqcjtKUIqHb9fNSUX+91ife3yHrjv1ee8ZYo76PqiQ7kAnT79+ygDH
	WqWt0qJcEMH3UkSCFxmdV7SCMiqJPt1XxCvMsiUsrznDxH7yX15F0Vw/AdnJjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643626271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1HrP+Vgt7n8HpLZHmiyqAEpK9Ixl+Sdp3tB06tFj4yc=;
	b=MaOSiJLkg8AEcChbUuJMKsgGzU8A4SbK6zofyz0ImKVT9VSKNj0JPchJW0k/x6EYQIIyU+
	hhglHafTXe7PsJAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <Yfe/HRsKaGPPUc/B@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
 <c26a4348-fa0c-6eb6-a571-7dbc454c05d0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c26a4348-fa0c-6eb6-a571-7dbc454c05d0@gmail.com>
Message-ID-Hash: 324WDBPEIIROCQEAUVMWHX2IJQ22Y3UY
X-Message-ID-Hash: 324WDBPEIIROCQEAUVMWHX2IJQ22Y3UY
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/324WDBPEIIROCQEAUVMWHX2IJQ22Y3UY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-01-28 13:18:14 [+0300], Sergei Shtylyov wrote:
> On 1/27/22 2:32 PM, Sebastian Andrzej Siewior wrote:
> 
> > Provide generic_handle_irq_safe() which can be used can used from any
>                                           ^^^^^^^^^^^^^^^^^^^^
>    You're repeating yourself. :-)

corrected, thank you.

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
