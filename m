Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4977E4A41E7
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 12:09:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7CD383EE23
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 11:09:15 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 825173ED9F
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 11:09:11 +0000 (UTC)
Date: Mon, 31 Jan 2022 12:09:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643627350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3CXtlXLTYIfo3z5h+Q2OsJCQ12poAJsYf5yCuql9h1s=;
	b=c+YABeix0gi4ppJRFkLpKFxjY+Ytig8FpkSfuk/SZHFOHJ1gJQsbiGwZ6nfjejBPU8ERO5
	CYdn0GkZDT+VVJqI1WdZkpwPUQpeAi/n4+glk2vYUpuJetL9z4UGT2NCM1k/ey8x3dsRp9
	22j7zX0gciD3hf8NQNSeO/JfDgjz1zaZ+hpQUKYpH4ZYqdfBI2wJUOWRtUSCH4Zb2PAmtN
	ncatMzLntfDNR4ypAo4d8tRT+tx1CW0JOzEBBZf539Y0AVqw30qfM8cxcAmLcJYpBUMkVJ
	GkpokhJd/lbvLcVc5JPDox7q2v01KvGzwvT1wi0qPHNLn0SSKDrfzERT+GrNZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643627350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3CXtlXLTYIfo3z5h+Q2OsJCQ12poAJsYf5yCuql9h1s=;
	b=5s9Py6ARZQ6qDeei7b7BBr531WGkrJ236qvkaU0qhDyMd7g05rEbO+FeMqY4ay3u5mDJzN
	PY0FMItDPWWIGpAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Message-ID: <YffDVXN7fGFqYs1Y@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-3-bigeasy@linutronix.de>
 <4929165.31r3eYUQgx@natalenko.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4929165.31r3eYUQgx@natalenko.name>
Message-ID-Hash: 2U7N2PC2USW6WOJ2MLQAJLXAUA3VXCUB
X-Message-ID-Hash: 2U7N2PC2USW6WOJ2MLQAJLXAUA3VXCUB
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Michael Below <below@judiz.de>, Salvatore Bonaccorso <carnil@debian.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/7] i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2U7N2PC2USW6WOJ2MLQAJLXAUA3VXCUB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-01-27 15:41:24 [+0100], Oleksandr Natalenko wrote:
> Hello.
Hi,

> Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> 
> Worth linking [1] [2] and [3] as well maybe?

no, they are fixed since commit
   81e2073c175b8 ("genirq: Disable interrupts for force threaded handlers")

> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1873673
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=202453
> [3] https://lore.kernel.org/lkml/20201204201930.vtvitsq6xcftjj3o@spock.localdomain/

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
